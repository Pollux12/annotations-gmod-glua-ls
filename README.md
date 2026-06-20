# GLuaLS Annotation Generator

Automatically generates GLuaLS annotations for Garry's Mod API by scraping the [GMod Wiki](https://wiki.facepunch.com/gmod/). These annotations are consumed by [gmod-glua-ls](https://github.com/Pollux12/gmod-glua-ls).

Plugins are currently WIP and are not used.

**Note**: This repository is part of the GMod language server infrastructure.
Annotations are automatically downloaded by the VSCode extension from generated publish branches - manual setup is not required.

## Workflow

1. `npm run wiki-check-changed` checks whether upstream wiki content changed since the latest scrape tag.
2. `npm run scrape-wiki` scrapes and normalizes wiki pages, then writes Lua annotations into `output/`.
3. `npm test` validates scraper and writer behavior.
4. CI formats the generated files and publishes them to the branch used by the extension.

## Publishing branches

- `main` is for stable annotations.
  - Publishes base annotations to `gluals-annotations`
  - Publishes plugin annotations to `gluals-annotations-plugin-<plugin-id>`
- `beta` is for pre-release annotations.
  - Publishes base annotations to `gluals-annotations-prerelease`
  - Publishes plugin annotations to `gluals-annotations-prerelease-plugin-<plugin-id>`
- Do not edit the generated output branches by hand. Make changes on `main` or `beta` instead.
- Generated output branches keep their old commits, so users can choose an older annotation commit if needed.

### Scheduled publishing

GitHub scheduled workflows run from the default branch only. The scheduled publish workflow runs from `main`, but it still generates annotations from both branches:

- `main` → stable publish branches
- `beta` → prerelease publish branches

If `beta` does not exist on `origin`, the pre-release job fails with a clear error instead of publishing the wrong files.

### Promotion workflow

1. Land and validate annotation changes on `beta` first when they should ship as prerelease.
2. Promote the validated prerelease state by merging `beta` into `main`.
3. After that promotion merge, **immediately back-merge `main` into `beta`** so the prerelease branch keeps all stable fixes and branch history stays aligned.

Treat the back-merge from `main` to `beta` as mandatory after every promotion.

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

**Note**: The VSCode extension downloads annotations from `gluals-annotations` for stable builds and `gluals-annotations-prerelease` for pre-release builds. The setup above is only for testing local changes.

## Repository Layout

- `src/scrapers/` - GMod wiki scraping and normalization
- `src/api-writer/` - EmmyLua/LuaCATS annotation generation
- `plugin/` - framework plugin data and gluarc files used by the VSCode extension
- `custom/` - manual fixes added during generation
- `output/` - generated annotation files before they are published


## Plugin notes

The VSCode extension loads plugin data from the annotation bundle (`plugin/index.json` + `plugin/<id>/plugin.json`).

## Credits
Forked from [luttje/glua-api-snippets](https://github.com/luttje/glua-api-snippets)
