import { ClassFunction, Enum, Function, HookFunction, LibraryFunction, TypePage, Panel, PanelFunction, Realm, Struct, WikiPage, isPanel, FunctionArgument, FunctionCallback } from '../scrapers/wiki-page-markup-scraper.js';
import { indentText, wrapInComment, removeNewlines, safeFileName, toLowerCamelCase } from '../utils/string.js';
import {
  isClassFunction,
  isHookFunction,
  isLibraryFunction,
  isLibrary,
  isClass,
  isPanelFunction,
  isStruct,
  isEnum,
} from '../scrapers/wiki-page-markup-scraper.js';
import fs from 'fs';

export const RESERVERD_KEYWORDS = new Set([
  'and',
  'break',
  'continue',
  'do',
  'else',
  'elseif',
  'end',
  'false',
  'for',
  'function',
  'goto',
  'if',
  'in',
  'local',
  'nil',
  'not',
  'or',
  'repeat',
  'return',
  'then',
  'true',
  'until',
  'while'
]);

type IndexedWikiPage = {
  index: number;
  page: WikiPage;
};

type FunctionGenericHint = {
  genericTypeName: 'T';
  classArgumentName: string;
  baseType: 'Entity' | 'Panel';
  returnsCollection: boolean;
};

export class GluaApiWriter {
  private readonly writtenClasses: Set<string> = new Set();
  private readonly writtenLibraryGlobals: Set<string> = new Set();
  private readonly pageOverrides: Map<string, string> = new Map();

  private readonly files: Map<string, IndexedWikiPage[]> = new Map();

  // Class aliases to resolve case-sensitivity issues in inheritance
  // Maps canonical class names to their aliases
  // This fixes things like Panels not having PANEL hooks defined
  private readonly classAliases: Map<string, string[]> = new Map([
    ['Panel', ['PANEL']],
    ['Entity', ['ENTITY']],
    ['Weapon', ['WEAPON']],
    ['Vehicle', ['VEHICLE']],
    ['Tool', ['TOOL']],
  ]);

  constructor(
    public readonly outputDirectory: string = './output',
  ) { }

  public static safeName(name: string) {
    if (name.includes('/'))
      name = name.replace(/\//g, ' or ');

    if (name.includes('='))
      name = name.split('=')[0];

    if (name.includes(' '))
      name = toLowerCamelCase(name);

    // Remove any remaining characters not valid in a Lua variable/function name.
    name = name.replace(/[^A-Za-z\d_.]/g, '');

    if (RESERVERD_KEYWORDS.has(name))
      return `_${name}`;

    return name;
  }

  public addOverride(pageAddress: string, override: string) {
    this.pageOverrides.set(safeFileName(pageAddress, '.'), override);
  }

  private injectClassFieldsIntoOverride(override: string, className: string, classFields: string) {
    if (!classFields)
      return override.replace(/\n$/g, '');

    const trimmedOverride = override.replace(/\n$/g, '');
    const trimmedFields = classFields.replace(/\n+$/g, '');
    const classValuePattern = new RegExp(`(^(?:local\\s+)?${className.replace(/[.*+?^${}()|[\]\\]/g, '\\$&')}\\s*=\\s*\\{\\})`, 'm');

    if (!classValuePattern.test(trimmedOverride))
      return `${trimmedOverride}\n${trimmedFields}`;

    return trimmedOverride.replace(classValuePattern, `${trimmedFields}\n\n$1`);
  }

  /**
   * Checks if a class name has aliases that should be generated.
   */
  private hasClassAliases(className: string): boolean {
    return this.classAliases.has(className);
  }

  /**
   * Gets the aliases for a given canonical class name.
   */
  private getClassAliases(className: string): string[] {
    return this.classAliases.get(className) || [];
  }

  /**
   * Resolves a class name to its canonical form.
   * If the class name is an alias, returns the canonical name.
   * Otherwise returns the original name.
   */
  private resolveToCanonicalClassName(className: string): string {
    if (!className) return className;

    // Check if this class name is an alias for another class
    for (const [canonical, aliases] of this.classAliases) {
      if (aliases.includes(className)) {
        return canonical;
      }
    }

    // Return the original name if no alias found
    return className;
  }

  private isFakeEnum(_enum: Enum) {
    // TODO: Kindly ask Rubat to add a <isFake> marker of sorts to the wiki
    return _enum.description.includes('**WARNING**: These enumerations do not exist in game and are listed here only for reference');
  }

  public writePage(page: WikiPage) {
    const fileSafeAddress = safeFileName(page.address, '.');
    if (this.pageOverrides.has(fileSafeAddress)) {
      let api = '';

      if (isClassFunction(page))
        api += this.writeClassStart(page.parent, undefined, undefined, undefined, page.deprecated);
      else if (isLibraryFunction(page))
        api += this.writeLibraryGlobalFallback(page);

      api += this.pageOverrides.get(fileSafeAddress);

      return `${api}\n\n`;
    } else if (isClassFunction(page))
      return this.writeClassFunction(page);
    else if (isLibraryFunction(page))
      return this.writeLibraryFunction(page);
    else if (isHookFunction(page))
      return this.writeHookFunction(page);
    else if (isPanel(page))
      return this.writePanel(page);
    else if (isPanelFunction(page))
      return this.writePanelFunction(page);
    else if (isEnum(page))
      return this.writeEnum(page);
    else if (isStruct(page))
      return this.writeStruct(page);
    else if (isLibrary(page))
      return this.writeLibraryGlobal(page);
    else if (isClass(page))
      return this.writeClassGlobal(page);
  }

  // Remove debug logging
  private writeClassStart(className: string, realm?: Realm, url?: string, parent?: string, deprecated?: string, description?: string, classFields: string = '') {
    let api: string = '';

    // Resolve class name to canonical form
    const canonicalClassName = this.resolveToCanonicalClassName(className);
    const isAlias = canonicalClassName !== className;

    if (!this.writtenClasses.has(canonicalClassName)) {
      const classOverride = `class.${canonicalClassName}`;
      if (this.pageOverrides.has(classOverride)) {
        api += this.injectClassFieldsIntoOverride(this.pageOverrides.get(classOverride)!, canonicalClassName, classFields) + '\n\n';
      } else {
        api += description ? `${wrapInComment(description, false)}\n` : '';
        api += this.writeRealmAnnotations(realm);
        api += this.writeSourceAnnotation(url);

        if (deprecated)
          api += `---@deprecated ${removeNewlines(deprecated)}\n`;

        api += `---@class (partial) ${canonicalClassName}`;

        if (parent)
          api += ` : ${parent}`;

        api += '\n';

        if (classFields) {
          api += classFields.replace(/\n+$/g, '') + '\n';
          api += '\n';
        }

        // for PLAYER, WEAPON, etc. we want to define globals
        if (canonicalClassName !== canonicalClassName.toUpperCase()) api += 'local ';
        api += `${canonicalClassName} = {}\n`;

        // Generate value aliases for case-insensitive class names
        // Prefer declaring the alias as a class inheriting from the canonical class,
        // then bind the alias value to the canonical table. This gives both value & type.
        if (this.hasClassAliases(canonicalClassName)) {
          const aliases = this.getClassAliases(canonicalClassName);
          for (const alias of aliases) {
            api += `---@class (partial) ${alias} : ${canonicalClassName}\n`;
            api += `${alias} = ${canonicalClassName}\n`;
          }
        }

        api += '\n';
      }

      this.writtenClasses.add(canonicalClassName);
    }

    // If this was an alias, don't generate any additional content
    if (isAlias) {
      return '';
    }

    return api;
  }

  private writeLibraryGlobalFallback(func: LibraryFunction) {
    if (!func.dontDefineParent && !this.writtenLibraryGlobals.has(func.parent)) {
      let api = '';

      api += `--- Missing description.\n`;
      api += `${func.parent} = {}\n\n`;

      this.writtenLibraryGlobals.add(func.parent);

      return api;
    }

    return '';
  }

  private writeLibraryGlobal(page: TypePage) {
    if (!this.writtenLibraryGlobals.has(page.name)) {
      let api = '';

      api += page.description ? `${wrapInComment(page.description, false)}\n` : '';

      if (page.deprecated)
        api += `---@deprecated ${removeNewlines(page.deprecated)}\n`;

      api += `${page.name} = {}\n\n`;

      this.writtenLibraryGlobals.add(page.name);

      return api;
    }

    return '';
  }

  private writeClassGlobal(page: TypePage) {
    return this.writeClassStart(page.name, page.realm, page.url, page.parent, page.deprecated, page.description);
  }

  private writeClassFunction(func: ClassFunction) {
    return this.writeFunctionWithOverloads(
      func,
      ':',
      this.writeClassStart(func.parent, undefined, undefined, undefined, func.deprecated),
    );
  }

  private writeLibraryFunction(func: LibraryFunction) {
    return this.writeFunctionWithOverloads(
      func,
      '.',
      this.writeLibraryGlobalFallback(func),
    );
  }

  private writeHookFunction(func: HookFunction) {
    return this.writeClassFunction(func);
  }

  private writePanel(panel: Panel) {
    let api: string = this.writeClassStart(panel.name, undefined, undefined, panel.parent, panel.deprecated, panel.description);

    return api;
  }

  private writePanelFunction(func: PanelFunction) {
    return this.writeFunctionWithOverloads(func, ':');
  }

  private writeFunctionWithOverloads(func: Function, indexer: string, prefix: string = '') {
    let api = prefix;

    const argumentSets = func.arguments && func.arguments.length > 0
      ? func.arguments.map(argSet => argSet.args)
      : [undefined];

    const [primaryArgs, ...overloadArgs] = argumentSets;

    api += this.writeFunctionLuaDocComment(func, primaryArgs, func.realm, overloadArgs);
    api += this.writeFunctionDeclaration(func, primaryArgs, indexer);

    return api;
  }

  private writeEnum(_enum: Enum) {
    let api: string = '';

    // If the first key is empty (like SCREENFADE has), check the second key
    const isContainedInTable =
      _enum.items[0]?.key === ''
        ? _enum.items[1]?.key.includes('.')
        : _enum.items[0]?.key.includes('.');

    api += _enum.description ? `${wrapInComment(_enum.description, false)}\n` : '';
    api += this.writeRealmAnnotations(_enum.realm);
    api += this.writeSourceAnnotation(_enum.url);

    if (_enum.deprecated)
      api += `---@deprecated ${removeNewlines(_enum.deprecated)}\n`;

    if (isContainedInTable) {
      api += `---@enum ${_enum.name}\n`;
      api += `${_enum.name} = {\n`;
    }

    const writeItem = (key: string, item: typeof _enum.items[0]) => {
      if (key === '') {
        // Happens for SCREENFADE which has a blank key to describe what 0 does.
        return;
      }

      if (isNaN(Number(item.value.trim()))) {
        // Happens for TODO value in NAV_MESH_BLOCKED_LUA in https://wiki.facepunch.com/gmod/Enums/NAV_MESH
        console.warn(`Enum ${_enum.name} has a TODO value for key ${key}. Skipping.`);
        return;
      }

      if (isContainedInTable) {
        key = key.split('.')[1];

        if (item.description?.trim()) {
          api += `${indentText(wrapInComment(item.description, false), 2)}\n`;
        }

        api += `  ${key} = ${item.value},\n`;
      } else {
        api += item.description ? `${wrapInComment(item.description, false)}\n` : '';
        if (item.deprecated)
          api += `---@deprecated ${removeNewlines(item.deprecated)}\n`;

        // Advanced annotation: top-level enum entries are immutable engine constants.
        api += `---@readonly\n`;
        api += `${key} = ${item.value}\n`;
      }
    };

    if (!this.isFakeEnum(_enum)) {
      for (const item of _enum.items)
        writeItem(item.key, item);
    }

    if (isContainedInTable) {
      api += '}';
    } else {
      // TODO: Clean up this workaround when LuaLS supports global enumerations.
      // Until LuaLS supports global enumerations (https://github.com/LuaLS/lua-language-server/issues/2721) we
      // will use @alias as a workaround.

      // Some enums like SNDLVL are fake in the wiki and only listed for reference, so we render those such that the enums
      // are explained in the annotation
      if (this.isFakeEnum(_enum)) {
        const enumValues: string[] = [];

        for (const item of _enum.items) {
          if (item.key !== '' && !isNaN(Number(item.value.trim()))) {
            api += `--- * \`${item.key}\` = \`${item.value}\`\n`;
            enumValues.push(item.value);
          }
        }

        const literalUnion = enumValues.join(' | ');
        const enumAliasValue = literalUnion.length > 0 ? `${literalUnion} | number` : 'number';
        api += `--- @alias ${_enum.name} ${enumAliasValue}\n`;
      } else {
        // Advanced annotation: emit numeric literals to help literal-type inference for enum-backed numbers.
        api += `\n---@alias ${_enum.name}\n`;
        api += '---| number # Raw numeric enum value\n';

        for (const item of _enum.items) {
          if (item.key !== '' && !isNaN(Number(item.value.trim()))) {
            api += `---| ${item.value} # ${item.key}\n`;
          }
        }
      }
    }

    api += `\n\n`;

    return api;
  }

  private writeStructField(field: Struct['fields'][number]) {
    let api = '';

    if (field.deprecated)
      api += `---@deprecated ${removeNewlines(field.deprecated)}\n`;

    const comment = field.default !== undefined
      ? `${field.description ? `${field.description}\n\n` : ''}Default: \`${field.default}\``
      : field.description;

    if (comment)
      api += `---${wrapInComment(comment)}\n`;

    const type = GluaApiWriter.transformType(field.type, field.callback);
    const { optional, inlineDefault } = this.getStructFieldDefaultAnnotation(field.default);
    api += `---@field ${GluaApiWriter.safeName(field.name)}${optional} ${type}${inlineDefault}\n`;

    return api;
  }

  private getStructFieldDefaultAnnotation(defaultValue: string | undefined): { optional: string; inlineDefault: string } {
    if (defaultValue === undefined)
      return { optional: '', inlineDefault: '' };

    const trimmedDefault = String(defaultValue).trim();
    if (trimmedDefault.toLowerCase() === 'nil')
      return { optional: '?', inlineDefault: '' };

    const normalizedDefault = this.normalizeInlineDefaultValue(trimmedDefault);
    return { optional: '', inlineDefault: `=${normalizedDefault}` };
  }

  private normalizeInlineDefaultValue(defaultValue: string): string {
    if (/^[+-]?(?:\d+\.?\d*|\.\d+)$/.test(defaultValue))
      return defaultValue;

    if (/^(true|false)$/i.test(defaultValue))
      return defaultValue.toLowerCase();

    const unwrappedCode = defaultValue.replace(/^`(.+)`$/, '$1').trim();
    const boldMatch = unwrappedCode.match(/^\*\*(.*)\*\*$/);
    const normalizedText = (boldMatch ? boldMatch[1] : unwrappedCode).trim();

    if (normalizedText.toLowerCase() === 'empty')
      return '""';

    if (/^"(?:[^"\\]|\\.)*"$/.test(normalizedText) || /^'(?:[^'\\]|\\.)*'$/.test(normalizedText))
      return normalizedText;

    return JSON.stringify(normalizedText);
  }

  private writeStruct(struct: Struct) {
    const classFields = struct.fields.map(field => this.writeStructField(field)).join('');
    return this.writeClassStart(struct.name, struct.realm, struct.url, undefined, struct.deprecated, struct.description, classFields);
  }

  public writePages(pages: WikiPage[], filePath: string, index: number = 0) {
    if (!this.files.has(filePath)) this.files.set(filePath, []);

    pages.forEach(page => {
      this.files.get(filePath)!.push({ index: index, page: page });
    });
  }

  public getPages(filePath: string) {
    return this.files.get(filePath) ?? [];
  }

  public makeApiFromPages(pages: IndexedWikiPage[]) {
    let api = '';

    pages.sort((a, b) => a.index - b.index);

    // First we write the "header" types
    for (const page of pages.filter(x => isClass(x.page) || isLibrary(x.page) || isPanel(x.page))) {
      try {
        api += this.writePage(page.page);
      } catch (e) {
        console.error(`Failed to write 'header' page ${page.page.address}: ${e}`);
      }
    }

    for (const page of pages.filter(x => !isClass(x.page) && !isLibrary(x.page) && !isPanel(x.page))) {
      try {
        api += this.writePage(page.page);
      } catch (e) {
        console.error(`Failed to write page ${page.page.address}: ${e}`);
      }
    }

    return api;
  }

  public writeToDisk() {
    const usedOverrides = new Set<string>();
    const moduleFileByName = new Map<string, string>();

    for (const [filePath, pages] of this.files) {
      const baseName = filePath.split(/[\\/]/).pop() ?? '';
      if (baseName.endsWith('.lua')) {
        moduleFileByName.set(baseName.slice(0, -4).toLowerCase(), filePath);
      }

      pages.forEach(({ page }) => {
        usedOverrides.add(safeFileName(page.address, '.'));
      });
    }

    // Process module files first so that class overrides with corresponding wiki
    // pages are emitted inline (via writeClassStart) alongside their methods.
    this.files.forEach((pages: IndexedWikiPage[], filePath: string) => {
      let api = this.makeApiFromPages(pages);

      if (api.length > 0) {
        fs.appendFileSync(filePath, '---@meta\n\n' + api);
      }
    });

    const orphanFunctionOverrides = new Map<string, string[]>();

    for (const [pageAddress, override] of this.pageOverrides.entries()) {
      if (usedOverrides.has(pageAddress)) continue;
      if (pageAddress.startsWith('class.')) continue;

      const moduleMatch = pageAddress.match(/^([^.]+)\./);
      if (!moduleMatch) continue;

      const moduleFilePath = moduleFileByName.get(moduleMatch[1].toLowerCase());
      if (!moduleFilePath) {
        console.warn(`[orphan-override] No module file found for override "${pageAddress}" (prefix "${moduleMatch[1]}"). The override will be dropped.`);
        continue;
      }

      const current = orphanFunctionOverrides.get(moduleFilePath) ?? [];
      current.push(override.endsWith('\n') ? override : `${override}\n`);
      orphanFunctionOverrides.set(moduleFilePath, current);
    }

    for (const [moduleFilePath, overrides] of orphanFunctionOverrides) {
      if (overrides.length === 0) continue;

      const joinedOverrides = overrides.join('\n');

      if (fs.existsSync(moduleFilePath)) {
        const existing = fs.readFileSync(moduleFilePath, 'utf-8');
        const separator = existing.endsWith('\n') ? '' : '\n';
        fs.appendFileSync(moduleFilePath, `${separator}\n${joinedOverrides}`);
      } else {
        fs.writeFileSync(moduleFilePath, ['---@meta', '', ...joinedOverrides.split('\n')].join('\n'));
      }
    }

    // Then, emit any class.* overrides that weren't triggered by wiki pages.
    // These are truly orphan classes with no corresponding wiki module.
    const orphanClassOverrides: string[] = [];
    for (const [key, value] of this.pageOverrides.entries()) {
      const m = key.match(/^class\.(.+)$/);
      if (m) {
        const className = m[1];
        // Respect canonical alias resolution
        const canonical = this.resolveToCanonicalClassName(className);
        if (!this.writtenClasses.has(canonical)) {
          // Mark as written to avoid duplicate emission later should a late page appear.
          this.writtenClasses.add(canonical);
          // Normalize trailing newline
          orphanClassOverrides.push(value.endsWith('\n') ? value : value + '\n');
        }
      }
    }
    if (orphanClassOverrides.length > 0) {
      const customFile = `${this.outputDirectory}/custom_classes.lua`;
      const payload = ['---@meta', '', ...orphanClassOverrides].join('\n');
      fs.writeFileSync(customFile, payload);
    }
  }

  public static transformType(type: string, callback?: FunctionCallback) {
    if (type === 'vararg')
      return 'any';

    // Convert `function` type to `fun(cmd: string, args: string):(returnValueName: string[]?)`
    if (type === 'function' && callback) {
      let callbackString = `fun(`;

      const callbackArgsLength = callback.arguments?.length || 0;

      for (let i = 0; i < callbackArgsLength; i++) {
        const arg = callback.arguments![i];

        if (!arg.name) {
          arg.name = `arg${i}`;
        }

        if (arg.type === 'vararg')
          arg.name = '...';

        callbackString += `${GluaApiWriter.safeName(arg.name)}: ${GluaApiWriter.transformType(arg.type)}${arg.default !== undefined ? `?` : ''}, `;
      }

      // Remove trailing comma and space
      if (callbackString.endsWith(', '))
        callbackString = callbackString.substring(0, callbackString.length - 2);

      callbackString += ')';

      if (callback.returns?.length) {
        callbackString += ':(';
      }

      const callbackReturnsLength = callback.returns?.length || 0;

      for (let i = 0; i < callbackReturnsLength; i++) {
        const ret = callback.returns![i];

        if (!ret.name) {
          ret.name = `ret${i}`;
        }

        if (ret.type === 'vararg')
          ret.name = '...';

        callbackString += `${ret.name}: ${this.transformType(ret.type)}${ret.default !== undefined ? `?` : ''}, `;
      }

      // Remove trailing comma and space
      if (callbackString.endsWith(', '))
        callbackString = callbackString.substring(0, callbackString.length - 2);

      if (callback.returns?.length) {
        callbackString += ')';
      }

      return callbackString;
    } else if (type.startsWith('table<') && !type.includes(',')) {
      // Convert `table<Player>` to `Player[]` for LuaLS (but leave table<x, y> untouched)
      let innerType = type.match(/<([^>]+)>/)?.[1];

      if (!innerType) throw new Error(`Invalid table type: ${type}`);

      return `${innerType}[]`;
    } else if (type.startsWith('table{') || type.startsWith('Panel{')) {
      // Convert `table{ToScreenData}` structures to `ToScreenData` class for LuaLS
      // Also converts `Panel{DVScrollBar}` to `DVScrollBar` class for LuaLS
      let innerType = type.match(/{([^}]+)}/)?.[1];

      if (!innerType) throw new Error(`Invalid table type: ${type}`);

      return innerType;
    } else if (type.startsWith('number{')) {
      // Convert `number{MATERIAL_FOG}` to `MATERIAL_FOG` enum for LuaLS
      let innerType = type.match(/{([^}]+)}/)?.[1];

      if (!innerType) throw new Error(`Invalid number type: ${type}`);

      return innerType;
    }

    return type;
  }

  private getRealmTags(realm: Realm): string[] {
    switch (realm) {
      case 'menu':
        return ['menu'];
      case 'client':
        return ['client'];
      case 'server':
        return ['server'];
      case 'shared':
        return ['shared'];
      case 'client and menu':
        return ['client', 'menu'];
      case 'shared and menu':
        return ['shared', 'menu'];
      default:
        throw new Error(`Unknown realm: ${realm}`);
    }
  }

  private writeRealmAnnotations(realm?: Realm): string {
    if (!realm)
      return '';

    return this.getRealmTags(realm)
      .map(realmTag => `---@realm ${realmTag}\n`)
      .join('');
  }

  private writeSourceAnnotation(url?: string): string {
    if (!url)
      return '';

    return `---@source ${url}\n`;
  }

  private getFunctionGenericHint(func: Function, args: FunctionArgument[] | undefined): FunctionGenericHint | undefined {
    if (!args || args.length === 0 || !func.returns || func.returns.length !== 1)
      return undefined;

    const classArgument = args.find(arg => arg.name === 'class' && arg.type === 'string' && !arg.altType && !arg.callback);
    if (!classArgument)
      return undefined;

    const transformedReturnType = GluaApiWriter.transformType(func.returns[0].type, func.returns[0].callback);

    if (transformedReturnType === 'Entity' || transformedReturnType === 'Panel') {
      return {
        genericTypeName: 'T',
        classArgumentName: classArgument.name!,
        baseType: transformedReturnType,
        returnsCollection: false,
      };
    }

    if (transformedReturnType === 'Entity[]' || transformedReturnType === 'Panel[]') {
      return {
        genericTypeName: 'T',
        classArgumentName: classArgument.name!,
        baseType: transformedReturnType.replace('[]', '') as 'Entity' | 'Panel',
        returnsCollection: true,
      };
    }

    return undefined;
  }

  private getArgumentTypes(arg: FunctionArgument): string[] {
    const types = arg.type.split('|');

    if (arg.altType) {
      types.push(arg.altType);
    }

    return types;
  }

  private getArgumentTypeString(arg: FunctionArgument): string {
    return this.getArgumentTypes(arg)
      .map(type => GluaApiWriter.transformType(type, arg.callback))
      .join('|');
  }

  private getOverloadSignature(func: Function, args: FunctionArgument[] | undefined): string {
    const overloadArgs = args ?? [];

    const argumentSignature = overloadArgs.map(arg => {
      if (!arg.name)
        arg.name = arg.type;

      if (arg.type === 'vararg')
        return '...: any';

      const typesString = this.getArgumentTypeString(arg);
      return `${GluaApiWriter.safeName(arg.name)}${arg.default !== undefined ? `?` : ''}: ${typesString}`;
    }).join(', ');

    const returns = func.returns ?? [];
    if (returns.length === 0) {
      return `fun(${argumentSignature})`;
    }

    if (returns.length === 1) {
      const ret = returns[0];
      const retType = ret.type === 'vararg'
        ? 'any'
        : GluaApiWriter.transformType(ret.type, ret.callback);
      return `fun(${argumentSignature}): ${retType}`;
    }

    const returnSignature = returns.map((ret, index) => {
      if (ret.type === 'vararg')
        return '...: any';

      const returnName = ret.name ? GluaApiWriter.safeName(ret.name) : `ret${index}`;
      return `${returnName}: ${GluaApiWriter.transformType(ret.type, ret.callback)}`;
    }).join(', ');

    return `fun(${argumentSignature}):(${returnSignature})`;
  }

  private writeOverloadAnnotations(func: Function, overloadArgs: Array<FunctionArgument[] | undefined>): string {
    if (overloadArgs.length === 0) {
      return '';
    }

    // Advanced annotation: multiple scraped argument sets represent real call-shape overloads.
    return overloadArgs
      .map(args => `---@overload ${this.getOverloadSignature(func, args)}\n`)
      .join('');
  }

  private writeFunctionLuaDocComment(
    func: Function,
    args: FunctionArgument[] | undefined,
    realm: Realm,
    overloadArgs: Array<FunctionArgument[] | undefined> = [],
  ) {
    let luaDocComment = '';

    if (func.description)
      luaDocComment += `---${wrapInComment(func.description)}\n`;

    if (isHookFunction(func))
      luaDocComment += `---@hook ${func.name}\n`;

    luaDocComment += this.writeRealmAnnotations(realm);
    luaDocComment += this.writeSourceAnnotation(func.url);
    luaDocComment += this.writeOverloadAnnotations(func, overloadArgs);

    const genericHint = this.getFunctionGenericHint(func, args);
    if (genericHint) {
      // Advanced annotation: this signature carries a concrete class-string -> instance type relationship.
      luaDocComment += `---@generic ${genericHint.genericTypeName} : ${genericHint.baseType}\n`;
    }

    if (args) {
      args.forEach(arg => {
        if (!arg.name)
          arg.name = arg.type;

        if (arg.type === 'vararg')
          arg.name = '...';

        // TODO: This splitting will fail in complicated cases like `table<string|number>|string`.
        // TODO: I'm assuming for now that there is no such case in the GMod API.
        let typesString = this.getArgumentTypeString(arg);
        if (genericHint && arg.name === genericHint.classArgumentName)
          typesString = `\`${genericHint.genericTypeName}\``;

        luaDocComment += `---@param ${GluaApiWriter.safeName(arg.name)}${arg.default !== undefined ? `?` : ''} ${typesString} ${wrapInComment(arg.description!)}\n`;
      });
    }

    if (func.returns) {
      func.returns.forEach((ret, index) => {
        const description = wrapInComment(ret.description!);

        luaDocComment += `---@return `;

        if (ret.type === 'vararg')
          luaDocComment += 'any ...';
        else if (genericHint && index === 0)
          luaDocComment += genericHint.returnsCollection
            ? `${genericHint.genericTypeName}[]`
            : genericHint.genericTypeName;
        else
          luaDocComment += `${GluaApiWriter.transformType(ret.type, ret.callback)}`;

        luaDocComment += ` # ${description}\n`;
      });
    }

    if (func.deprecated)
      luaDocComment += `---@deprecated ${removeNewlines(func.deprecated)}\n`;

    return luaDocComment;
  }

  private writeFunctionDeclaration(func: Function, args: FunctionArgument[] | undefined, indexer: string = '.') {
    // Resolve parent class name to canonical form (e.g., PANEL -> Panel)
    const parentName = func.parent ? this.resolveToCanonicalClassName(func.parent) : '';
    let declaration = `function ${parentName ? `${parentName}${indexer}` : ''}${GluaApiWriter.safeName(func.name)}(`;

    if (args) {
      declaration += args.map(arg => {
        if (arg.type === 'vararg')
          return '...';

        return GluaApiWriter.safeName(arg.name!);
      }).join(', ');
    }

    declaration += ') end\n\n';

    return declaration;
  }
}
