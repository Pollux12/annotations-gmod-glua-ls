import { markup as classFunctionMarkup, json as classFunctionJson } from '../test-data/offline-sites/gmod-wiki/class-function-weapon-allowsautoswitchto';
import { markup as libraryFunctionMarkup, json as libraryFunctionJson } from '../test-data/offline-sites/gmod-wiki/library-function-ai-getscheduleid';
import { ClassFunction, Enum, HookFunction, LibraryFunction, Struct, WikiPageMarkupScraper } from '../../src/scrapers/wiki-page-markup-scraper';
import { markup as hookMarkup, json as hookJson } from '../test-data/offline-sites/gmod-wiki/hook-player-initial-spawn';
import { markup as structMarkup, json as structJson } from '../test-data/offline-sites/gmod-wiki/struct-ang-pos';
import { markup as enumMarkup, json as enumJson } from '../test-data/offline-sites/gmod-wiki/enums-use';
import { markup as callbackInDescriptionMarkup, json as callbackInDescriptionJson } from '../test-data/offline-sites/gmod-wiki/library-function-spawnmenu-getcontenttype';
import fetchMock from "jest-fetch-mock";

describe('GMod Wiki Page Markup Parse', () => {
  beforeEach(() => {
    fetchMock.resetMocks();
  });

  it('should be able to parse a library func markup', async () => {
    fetchMock.mockResponseOnce(libraryFunctionMarkup);

    const responseMock = <Response>{
      url: libraryFunctionJson.url,
    };
    const scrapeCallback = new WikiPageMarkupScraper(responseMock.url).getScrapeCallback();

    expect(scrapeCallback(responseMock, libraryFunctionMarkup)).toEqual([<LibraryFunction>libraryFunctionJson]);
  });

  it('should parse lowercase file.Read and file.Write pages as file library functions', async () => {
    const readMarkup = `
<function name="Read" parent="file" type="libraryfunc">
  <description>Returns the content of a file.</description>
  <realm>Shared and Menu</realm>
  <args>
    <arg name="fileName" type="string">The name of the file.</arg>
    <arg name="gamePath" type="string" default="DATA">The path to look for the files and directories in.</arg>
  </args>
  <rets>
    <ret name="" type="string">The data from the file as a string, or nil if the file is not found.</ret>
  </rets>
</function>`;
    const writeMarkup = `
<function name="Write" parent="file" type="libraryfunc">
  <description>Writes the given string to a file.</description>
  <realm>Shared and Menu</realm>
  <args>
    <arg name="fileName" type="string">The name of the file being written into.</arg>
    <arg name="content" type="string">The content that will be written into the file.</arg>
  </args>
  <rets>
    <ret name="" type="boolean">If the operation was successful.</ret>
  </rets>
</function>`;

    const readResponseMock = <Response>{
      url: 'https://wiki.facepunch.com/gmod/file.Read?format=text',
    };
    const writeResponseMock = <Response>{
      url: 'https://wiki.facepunch.com/gmod/file.Write?format=text',
    };

    const [readPage] = new WikiPageMarkupScraper(readResponseMock.url).getScrapeCallback()(readResponseMock, readMarkup) as LibraryFunction[];
    const [writePage] = new WikiPageMarkupScraper(writeResponseMock.url).getScrapeCallback()(writeResponseMock, writeMarkup) as LibraryFunction[];

    expect(readPage.type).toBe('libraryfunc');
    expect(readPage.parent).toBe('file');
    expect(readPage.address).toBe('file.Read');
    expect(writePage.type).toBe('libraryfunc');
    expect(writePage.parent).toBe('file');
    expect(writePage.address).toBe('file.Write');
  });

  it('should be able to parse a class function markup', async () => {
    fetchMock.mockResponseOnce(classFunctionMarkup);

    const responseMock = <Response>{
      url: classFunctionJson.url
    };
    const scrapeCallback = new WikiPageMarkupScraper(responseMock.url).getScrapeCallback();

    expect(scrapeCallback(responseMock, classFunctionMarkup)).toEqual([<ClassFunction>classFunctionJson]);
  });

  it('should be able to parse a hook function markup', async () => {
    fetchMock.mockResponseOnce(hookMarkup);

    const responseMock = <Response>{
      url: hookJson.url,
    };
    const scrapeCallback = new WikiPageMarkupScraper(responseMock.url).getScrapeCallback();

    expect(scrapeCallback(responseMock, hookMarkup)).toEqual([<HookFunction>hookJson]);
  });

  it('should be able to parse a enum markup', async () => {
    fetchMock.mockResponseOnce(enumMarkup);

    const responseMock = <Response>{
      url: enumJson.url,
    };
    const scrapeCallback = new WikiPageMarkupScraper(responseMock.url).getScrapeCallback();

    expect(scrapeCallback(responseMock, enumMarkup)).toEqual([<Enum>enumJson]);
  });

  it('should be able to parse a structure markup', async () => {
    fetchMock.mockResponseOnce(structMarkup);

    const responseMock = <Response>{
      url: structJson.url,
    };
    const scrapeCallback = new WikiPageMarkupScraper(responseMock.url).getScrapeCallback();

    expect(scrapeCallback(responseMock, structMarkup)).toEqual([<Struct>structJson]);
  });

  it('should handle callbacks in description', async () => {
    fetchMock.mockResponseOnce(callbackInDescriptionMarkup);

    const responseMock = <Response>{
      url: callbackInDescriptionJson.url,
    };
    const scrapeCallback = new WikiPageMarkupScraper(responseMock.url).getScrapeCallback();

    expect(scrapeCallback(responseMock, callbackInDescriptionMarkup)).toEqual([<LibraryFunction>callbackInDescriptionJson]);
  });

  it('should promote singular structure references from raw arg markup', () => {
    const markup = `
<function name="SpawnFunction" parent="ENTITY" type="hook">
  <description>Test.</description>
  <realm>Server</realm>
  <args>
    <arg name="tr" type="table">A <page>Structures/TraceResult</page> from player eyes to their aim position</arg>
    <arg name="propertyData" type="table">A table that defines the property. Uses the <page>Structures/PropertyAdd</page>.</arg>
  </args>
</function>`;

    const responseMock = <Response>{
      url: 'https://wiki.facepunch.com/gmod/Test.StructureParam?format=text',
    };
    const scrapeCallback = new WikiPageMarkupScraper(responseMock.url).getScrapeCallback();
    const [page] = scrapeCallback(responseMock, markup) as HookFunction[];

    expect(page.arguments?.[0].args?.[0].type).toBe('TraceResult');
    expect(page.arguments?.[0].args?.[1].type).toBe('PropertyAdd');
  });

  it('should keep collection-like structure references as table', () => {
    const markup = `
<function name="PhysicsFromMesh" parent="Entity" type="classfunc">
  <description>Test.</description>
  <realm>Shared</realm>
  <args>
    <arg name="vertices" type="table">A table consisting of <page>Structures/MeshVertex</page>. Every 3 vertices define a triangle in the physics mesh.</arg>
    <arg name="bones" type="table">Table with a <page>Structures/BoneManipulationData</page> for every bone using the bone ID as the table index.</arg>
  </args>
</function>`;

    const responseMock = <Response>{
      url: 'https://wiki.facepunch.com/gmod/Test.StructureCollection?format=text',
    };
    const scrapeCallback = new WikiPageMarkupScraper(responseMock.url).getScrapeCallback();
    const [page] = scrapeCallback(responseMock, markup) as ClassFunction[];

    expect(page.arguments?.[0].args?.[0].type).toBe('table');
    expect(page.arguments?.[0].args?.[1].type).toBe('table');
  });
});
