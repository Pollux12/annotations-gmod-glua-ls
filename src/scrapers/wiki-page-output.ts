import fs from 'fs';
import path from 'path';
import type { WikiPage } from './wiki-page-markup-scraper.js';

export type WikiPageOutputPaths = {
    moduleName: string;
    fileName: string;
    moduleDirectory: string;
    jsonPath: string;
    luaPath: string;
};

export function getWikiPageOutputPaths(baseDirectory: string, pageAddress: string): WikiPageOutputPaths {
    let fileName = pageAddress;
    let moduleName = fileName;

    if (fileName.includes('.') || fileName.includes(':') || fileName.includes('/')) {
        [moduleName, fileName] = fileName.split(/[:.\/]/, 2);
    }

    fileName = fileName.replace(/[^a-z0-9]/gi, '_').toLowerCase();
    moduleName = moduleName.toLowerCase();

    if (moduleName.endsWith('(library)')) moduleName = moduleName.substring(0, moduleName.length - 9);
    if (moduleName.endsWith('_hooks')) moduleName = moduleName.substring(0, moduleName.length - 6);

    const moduleDirectory = path.join(baseDirectory, moduleName);

    return {
        moduleName,
        fileName,
        moduleDirectory,
        jsonPath: path.join(moduleDirectory, `${fileName}.json`),
        luaPath: path.join(baseDirectory, `${moduleName}.lua`),
    };
}

export function mergeWikiPages(existingPages: WikiPage[], newPages: WikiPage[]): WikiPage[] {
    const pagesByAddress = new Map<string, WikiPage>();

    for (const page of existingPages) {
        pagesByAddress.set(page.address, page);
    }

    for (const page of newPages) {
        pagesByAddress.set(page.address, page);
    }

    return Array.from(pagesByAddress.values()).sort((a, b) => a.address.localeCompare(b.address));
}

function getValidWikiPages(pages: unknown[], jsonPath: string): WikiPage[] {
    const validPages: WikiPage[] = [];
    let invalidCount = 0;

    for (const page of pages) {
        if (page && typeof page === 'object' && 'address' in page && typeof page.address === 'string') {
            validPages.push(page as WikiPage);
        } else {
            invalidCount++;
        }
    }

    if (invalidCount > 0) {
        console.warn(`Ignored ${invalidCount} invalid wiki page entries in ${jsonPath}`);
    }

    return validPages;
}

export function writeMergedWikiPageJson(jsonPath: string, pages: WikiPage[]) {
    let existingPages: WikiPage[] = [];

    if (fs.existsSync(jsonPath)) {
        try {
            const existingJson = fs.readFileSync(jsonPath, { encoding: 'utf-8' });
            const parsed = JSON.parse(existingJson);

            if (Array.isArray(parsed)) {
                existingPages = getValidWikiPages(parsed, jsonPath);
            }
        } catch (error) {
            const message = error instanceof Error ? error.message : String(error);
            console.warn(`Failed to read existing wiki page JSON ${jsonPath}: ${message}`);
        }
    }

    const mergedPages = mergeWikiPages(existingPages, pages);
    fs.writeFileSync(jsonPath, JSON.stringify(mergedPages, null, 2));
}
