import fs from 'fs';
import os from 'os';
import path from 'path';
import { jest } from '@jest/globals';
import { GluaApiWriter } from '../../src/api-writer/glua-api-writer';
import type { ClassFunction, LibraryFunction, WikiPage } from '../../src/scrapers/wiki-page-markup-scraper';
import { getWikiPageOutputPaths, writeMergedWikiPageJson } from '../../src/scrapers/wiki-page-output';

const fileReadLibraryPage: LibraryFunction = {
    type: 'libraryfunc',
    parent: 'file',
    name: 'Read',
    address: 'file.Read',
    description: 'Returns the content of a file.',
    realm: 'shared and menu',
    arguments: [
        {
            args: [
                {
                    name: 'fileName',
                    type: 'string',
                    description: 'The name of the file.',
                },
                {
                    name: 'gamePath',
                    type: 'string',
                    description: 'The path to look for the files and directories in.',
                    default: 'DATA',
                },
            ],
        },
    ],
    returns: [
        {
            name: '',
            type: 'string',
            description: 'The data from the file as a string, or nil if the file is not found.',
        },
    ],
    url: 'https://wiki.facepunch.com/gmod/file.Read',
};

const fileReadClassPage: ClassFunction = {
    type: 'classfunc',
    parent: 'File',
    name: 'Read',
    address: 'File:Read',
    description: 'Reads the specified amount of chars and returns them as a binary string.',
    realm: 'shared and menu',
    arguments: [
        {
            args: [
                {
                    name: 'length',
                    type: 'number',
                    description: 'Reads the specified amount of chars.',
                    default: 'nil',
                },
            ],
        },
    ],
    returns: [
        {
            name: 'data',
            type: 'string',
            description: 'The read data.',
        },
    ],
    url: 'https://wiki.facepunch.com/gmod/File:Read',
};

describe('Wiki page output', () => {
    it('preserves pages with distinct addresses that share a normalized JSON path', () => {
        const tmpRoot = fs.mkdtempSync(path.join(os.tmpdir(), 'gluals-page-output-'));
        const outputPath = path.join(tmpRoot, 'output');

        try {
            const libraryPaths = getWikiPageOutputPaths(outputPath, fileReadLibraryPage.address);
            const classPaths = getWikiPageOutputPaths(outputPath, fileReadClassPage.address);

            expect(libraryPaths.jsonPath).toBe(classPaths.jsonPath);

            fs.mkdirSync(libraryPaths.moduleDirectory, { recursive: true });
            writeMergedWikiPageJson(libraryPaths.jsonPath, [fileReadLibraryPage]);
            writeMergedWikiPageJson(classPaths.jsonPath, [fileReadClassPage]);

            const pages = JSON.parse(fs.readFileSync(libraryPaths.jsonPath, 'utf8')) as WikiPage[];
            expect(pages).toHaveLength(2);
            expect(pages.map((page) => page.address).sort()).toEqual(['File:Read', 'file.Read']);

            const writer = new GluaApiWriter();
            writer.writePages(pages, '<irrelevant for this test>');
            const api = writer.makeApiFromPages(writer.getPages('<irrelevant for this test>'));

            expect(api).toContain('function file.Read(fileName, gamePath) end');
            expect(api).toContain('function File:Read(length) end');
        } finally {
            fs.rmSync(tmpRoot, { recursive: true, force: true });
        }
    });

    it('replaces an existing page with the same address instead of duplicating it', () => {
        const tmpRoot = fs.mkdtempSync(path.join(os.tmpdir(), 'gluals-page-output-'));
        const outputPath = path.join(tmpRoot, 'output');

        try {
            const outputPaths = getWikiPageOutputPaths(outputPath, fileReadLibraryPage.address);
            fs.mkdirSync(outputPaths.moduleDirectory, { recursive: true });

            writeMergedWikiPageJson(outputPaths.jsonPath, [fileReadLibraryPage]);
            writeMergedWikiPageJson(outputPaths.jsonPath, [{
                ...fileReadLibraryPage,
                description: 'Updated description.',
            }]);

            const pages = JSON.parse(fs.readFileSync(outputPaths.jsonPath, 'utf8')) as WikiPage[];
            expect(pages).toHaveLength(1);
            expect(pages[0].address).toBe('file.Read');
            expect(pages[0].description).toBe('Updated description.');
        } finally {
            fs.rmSync(tmpRoot, { recursive: true, force: true });
        }
    });

    it('continues writing new pages when existing JSON is malformed', () => {
        const tmpRoot = fs.mkdtempSync(path.join(os.tmpdir(), 'gluals-page-output-'));
        const outputPath = path.join(tmpRoot, 'output');

        try {
            const outputPaths = getWikiPageOutputPaths(outputPath, fileReadLibraryPage.address);
            fs.mkdirSync(outputPaths.moduleDirectory, { recursive: true });
            fs.writeFileSync(outputPaths.jsonPath, '{', 'utf8');

            const warnSpy = jest.spyOn(console, 'warn').mockImplementation(() => undefined);
            try {
                writeMergedWikiPageJson(outputPaths.jsonPath, [fileReadLibraryPage]);

                const pages = JSON.parse(fs.readFileSync(outputPaths.jsonPath, 'utf8')) as WikiPage[];
                expect(pages).toHaveLength(1);
                expect(pages[0].address).toBe('file.Read');
                expect(warnSpy).toHaveBeenCalledWith(expect.stringContaining('Failed to read existing wiki page JSON'));
            } finally {
                warnSpy.mockRestore();
            }
        } finally {
            fs.rmSync(tmpRoot, { recursive: true, force: true });
        }
    });

    it('ignores invalid entries in existing JSON arrays', () => {
        const tmpRoot = fs.mkdtempSync(path.join(os.tmpdir(), 'gluals-page-output-'));
        const outputPath = path.join(tmpRoot, 'output');

        try {
            const outputPaths = getWikiPageOutputPaths(outputPath, fileReadLibraryPage.address);
            fs.mkdirSync(outputPaths.moduleDirectory, { recursive: true });
            fs.writeFileSync(outputPaths.jsonPath, JSON.stringify([null, {}, { address: 123 }, fileReadClassPage]), 'utf8');

            const warnSpy = jest.spyOn(console, 'warn').mockImplementation(() => undefined);
            try {
                writeMergedWikiPageJson(outputPaths.jsonPath, [fileReadLibraryPage]);

                const pages = JSON.parse(fs.readFileSync(outputPaths.jsonPath, 'utf8')) as WikiPage[];
                expect(pages).toHaveLength(2);
                expect(pages.map((page) => page.address).sort()).toEqual(['File:Read', 'file.Read']);
                expect(warnSpy).toHaveBeenCalledWith(expect.stringContaining('Ignored 3 invalid wiki page entries'));
            } finally {
                warnSpy.mockRestore();
            }
        } finally {
            fs.rmSync(tmpRoot, { recursive: true, force: true });
        }
    });
});
