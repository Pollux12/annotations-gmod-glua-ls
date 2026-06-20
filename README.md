# GLuaLS Annotation Generator

Automatically generates GLuaLS annotations for Garry's Mod API by scraping the [GMod Wiki](https://wiki.facepunch.com/gmod/). These annotations are consumed by [gmod-glua-ls](https://github.com/Pollux12/gmod-glua-ls).

Plugins are currently WIP and are not used.

**Note**: This repository is part of the GMod language server infrastructure.
Annotations are automatically downloaded by the VSCode extension from generated publish branches - manual setup is not required.

`npm run scrape-wiki` scrapes and normalizes wiki pages, then writes Lua annotations into `output/`.

## Branches

- `main` is for stable annotations.
  - Publishes base annotations to `gluals-annotations`
  - Publishes plugin annotations to `gluals-annotations-plugin-<plugin-id>`
- `beta` is for pre-release annotations.
  - Publishes base annotations to `gluals-annotations-prerelease`
  - Publishes plugin annotations to `gluals-annotations-prerelease-plugin-<plugin-id>`
- Do not edit the generated output branches by hand. Make changes on `main` or `beta` instead.
- Generated output branches keep their old commits, so users can choose an older annotation commit if needed.

## Development Setup

Requirements:

- Node.js `>= 21`

Install dependencies:

```bash
npm ci
```

Generate annotations locally:

```bash
npm run scrape-wiki
```

Run tests:

```bash
npm test
```

Build a release ZIP locally (old workflow, not needed for normal extension downloads):

```bash
npm run pack-release
```

## Local Development Testing

For local language server testing, use the override setting in the VSCode extension to point annotations to your generated local output folder.

## Repository Layout

- `src/scrapers/` - GMod wiki scraping and normalization
- `src/api-writer/` - EmmyLua/LuaCATS annotation generation
- `plugin/` - framework plugin data and gluarc files used by the VSCode extension
- `custom/` - manual fixes added during generation
- `output/` - generated annotation files before they are published


## Plugin notes

The VSCode extension loads plugin data from the annotation bundle (`plugin/index.json` + `plugin/<id>/plugin.json`).

## Credits
Based on [luttje/glua-api-snippets](https://github.com/luttje/glua-api-snippets)
