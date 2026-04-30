# GLuaLS Annotation Generator

Automatically generates GLuaLS annotations for Garry's Mod API by scraping the [GMod Wiki](https://wiki.facepunch.com/gmod/). These annotations are consumed by [gmod-glua-ls](https://github.com/Pollux12/gmod-glua-ls).

Plugins are currently WIP and are not used.

**Note**: This repository is part of the GMod language server infrastructure.
Annotations are automatically downloaded by the VSCode extension from the `gluals-annotations` branch - manual setup is not required for end users.

## Workflow

1. `npm run wiki-check-changed` checks whether upstream wiki content changed since the latest scrape tag.
2. `npm run scrape-wiki` scrapes and normalizes wiki pages, then writes Lua annotations into `output/`.
3. `npm test` validates scraper and writer behavior.
4. CI formats generated output and publishes annotations to the `gluals-annotations` branch for extension consumption.

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

Build release artifact locally (legacy, not required for branch-based consumption):

```bash
npm run pack-release
```

## Local Development Testing

For local language server testing, generate annotations and point your workspace library to `./output/`:

```json
{
  "workspace": {
    "library": [
      "./output"
    ]
  }
}
```

**Note**: The VSCode extension automatically downloads production annotations from the `gluals-annotations` branch. The above configuration is only needed for testing local changes during development.

## Repository Layout

- `src/scrapers/` - GMod wiki scraping and normalization
- `src/api-writer/` - EmmyLua/LuaCATS annotation generation
- `plugin/` - framework plugin metadata + gluarc fragments consumed by the VSCode extension
- `custom/` - manual overrides merged during generation
- `output/` - generated annotation files (published to `gluals-annotations` branch)

## Plugin Metadata Notes

The VSCode extension loads plugin metadata from the annotation bundle (`plugin/index.json` + `plugin/<id>/plugin.json`).
Plugin apply remains extension-only; the language server does not resolve plugins at runtime.

## Credits
Forked from [luttje/glua-api-snippets](https://github.com/luttje/glua-api-snippets)