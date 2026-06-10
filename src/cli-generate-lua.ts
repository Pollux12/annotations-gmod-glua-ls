import { Command } from 'commander';
import fs from 'fs';
import path from 'path';
import { GluaApiWriter } from './api-writer/glua-api-writer.js';

function loadCustomOverrides(writer: GluaApiWriter, customDirectory: string) {
  const files = fs.readdirSync(customDirectory).sort();
  for (const file of files) {
    const filePath = path.join(customDirectory, file);
    const stat = fs.statSync(filePath);
    if (stat.isDirectory()) continue;

    if (file.startsWith('_')) {
      fs.copyFileSync(filePath, path.join(writer.outputDirectory, file));
      continue;
    }

    const pageName = file.replace(/\.lua$/, '');
    const fileContent = fs.readFileSync(filePath, { encoding: 'utf-8' });
    writer.addOverride(pageName, fileContent);
  }
}

function wipeLuaFiles(outputDirectory: string) {
  for (const entry of fs.readdirSync(outputDirectory)) {
    const fullPath = path.join(outputDirectory, entry);
    if (!fs.statSync(fullPath).isFile()) continue;
    if (entry.toLowerCase().endsWith('.lua')) fs.rmSync(fullPath);
  }
}

function collectJsonModules(outputDirectory: string): Array<{ moduleName: string; jsonFiles: string[] }> {
  const modules: Array<{ moduleName: string; jsonFiles: string[] }> = [];
  for (const entry of fs.readdirSync(outputDirectory).sort()) {
    const modulePath = path.join(outputDirectory, entry);
    if (!fs.statSync(modulePath).isDirectory()) continue;

    const jsonFiles = fs
      .readdirSync(modulePath)
      .filter((file) => file.toLowerCase().endsWith('.json'))
      .sort()
      .map((file) => path.join(modulePath, file));

    if (jsonFiles.length > 0) {
      modules.push({ moduleName: entry, jsonFiles });
    }
  }
  return modules;
}

async function main() {
  const program = new Command();
  program
    .description('Regenerate Lua annotations from existing JSON pages (no wiki scrape)')
    .option('-o, --output <path>', 'Output directory containing wiki JSON and Lua files', './output')
    .option('-c, --custom-overrides <path>', 'Custom override directory', './custom')
    .option('--no-wipe-lua', 'Skip deleting existing top-level Lua files before regenerating')
    .option('--raw-wiki', 'Skip applying custom overrides (use raw wiki data only)')
    .parse(process.argv);

  const options = program.opts();
  const outputDirectory = options.output.replace(/\/$/, '');
  const customDirectory = options.customOverrides.replace(/\/$/, '');

  if (!fs.existsSync(outputDirectory)) {
    throw new Error(`Output directory does not exist: ${outputDirectory}`);
  }

  const writer = new GluaApiWriter(outputDirectory);

  if (options.wipeLua) {
    wipeLuaFiles(outputDirectory);
  }

  if (!options.rawWiki) {
    if (!fs.existsSync(customDirectory)) {
      throw new Error(`Custom overrides directory does not exist: ${customDirectory}`);
    }
    loadCustomOverrides(writer, customDirectory);
  }

  const modules = collectJsonModules(outputDirectory);
  let pageIndex = 0;
  for (const moduleEntry of modules) {
    const moduleLuaPath = path.join(outputDirectory, `${moduleEntry.moduleName}.lua`);
    for (const jsonPath of moduleEntry.jsonFiles) {
      const content = fs.readFileSync(jsonPath, { encoding: 'utf-8' });
      const pages = JSON.parse(content);
      if (!Array.isArray(pages)) {
        continue;
      }
      writer.writePages(pages, moduleLuaPath, pageIndex++);
    }
  }

  writer.writeToDisk();
  console.log(`Regenerated Lua annotations from JSON in ${outputDirectory}`);
}

main().catch((err) => {
  console.error(err);
  process.exit(1);
});
