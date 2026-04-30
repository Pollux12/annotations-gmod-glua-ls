import * as cheerio from 'cheerio';

export function decodeEntities(encodedString: string): string {
  return cheerio.load(encodedString, undefined, false).text();
}
