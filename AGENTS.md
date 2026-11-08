# GLuaLS Annotations Repository Instructions

## Scope

- Generates the Garry's Mod API annotations that [gmod-glua-ls](https://github.com/Pollux12/gmod-glua-ls) loads. The language server is the only consumer, so an annotation is correct when it makes GLuaLS analyse real Garry's Mod code correctly.
- Garry's Mod runtime behaviour is the source of truth. Confirm it on the wiki or in the shipped Lua (`garrysmod/lua`, `garrysmod/gamemodes`) before changing a type.

## Branches and Publishing

- `beta` is the pre-release source; it publishes to `gluals-annotations-prerelease`. `main` is the stable source; it publishes to `gluals-annotations`. Plugin bundles publish to `<branch>-plugin-<plugin-id>`.
- Branch work off `beta`, and merge `beta` into `main` for a stable release.
- The VS Code extension fetches annotations from the publish branches; there are no GitHub releases. A change reaches users only once `.github/workflows/release-gluals.yml` publishes it.
- The workflow runs on every push to `main` or `beta` and on the 1st of each month. It scrapes the wiki, regenerates `output/`, runs `npm test`, and publishes only when every test passes, so a failing test blocks every change on that branch from shipping. Check the run after a push.
- Never edit `output/` or a publish branch by hand; both are generated.

## Layout

- `src/scrapers/`: wiki scraping and normalisation into JSON under `output/<module>/`.
- `src/api-writer/glua-api-writer.ts`: turns the JSON and the overrides into `output/*.lua`.
- `custom/`: hand-written overrides.
- `plugin/`: framework plugin data and gluarc files for the extension.
- `__tests__/`: Jest tests.

## Overrides

- An override file is named after the wiki page it replaces, with `.` as the separator: `Panel.SetVisible.lua`, `Global.IsEntity.lua`, `net.Start.lua`. Its content replaces the generated block for that page.
- `class.<Name>.lua` replaces a class header and its fields.
- Files starting with `_` (such as `_globals.lua`) are copied to `output/` as they are.
- A function the wiki lacks can be added with an override named like a page.
- Prefer fixing the scraper or writer when a whole family of pages is wrong. Use an override for an individual page whose wiki entry is wrong or incomplete, and keep its description and `---@realm`/`---@source` lines.
- `---@[...]` attributes (`call_arg`, `net_payload`, `fresh_result`, `keeps_children`, `self_call_type` and others) are read by gmod-glua-ls, which defines what each means. Adding or changing one needs a downstream test in gmod-glua-ls as well.

## Testing

- `npm test` runs Jest. Tests that read `output/` need generated output: `npm run scrape-wiki` fetches the wiki and regenerates; `npm run generate-all` regenerates from the JSON already in `output/`.
- Every test must guard something the language server depends on. Assert properties of the emitted `output/*.lua`: the types, params and returns of a function's block, an attribute on the right function, exactly one block per function, a class field.
- Do not assert that a `custom/` file contains what it was written with, and do not match whole override text against the output. Both are tautological, and a text match breaks on any layout change. Compare the block's meaningful lines instead, as the `signature` helper in `custom-annotations.spec.ts` does.
- Generator behaviour (how overrides merge, how pages map to files) belongs in `cli-generate-lua.spec.ts` with temporary fixtures, not in per-override checks.
- On Windows, the generator tests that spawn `npm run generate-lua` can fail when the whole suite runs in parallel; rerun that file alone before investigating.

## Commits

- One logical change per commit, with the message in sentence case describing the change (for example "Type the gmod_tool weapon table as a SWEP with its Tool map").
