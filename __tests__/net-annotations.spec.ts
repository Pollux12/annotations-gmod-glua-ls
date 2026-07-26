import fs from 'fs';
import path from 'path';

describe('generated net annotations', () => {
  const netLua = fs
    .readFileSync(path.join(process.cwd(), 'output', 'net.lua'), 'utf8')
    .replace(/\r\n/g, '\n');

  test('every payload wire format has exactly one read and one write', () => {
    const payloadPattern =
      /---@\[net_payload\("(read|write)", "([^"]+)"\)\]\nfunction (net\.[^(]+)\(/g;
    const byWireFormat = new Map<
      string,
      { read: string[]; write: string[] }
    >();

    for (const match of netLua.matchAll(payloadPattern)) {
      const [, direction, wireFormat, functionName] = match;
      const operations = byWireFormat.get(wireFormat) ?? {
        read: [],
        write: [],
      };
      operations[direction as 'read' | 'write'].push(functionName);
      byWireFormat.set(wireFormat, operations);
    }

    expect(byWireFormat.size).toBeGreaterThan(0);
    for (const [wireFormat, operations] of byWireFormat) {
      expect({
        wireFormat,
        reads: operations.read,
        writes: operations.write,
      }).toEqual({
        wireFormat,
        reads: [expect.stringMatching(/^net\.Read/)],
        writes: [expect.stringMatching(/^net\.Write/)],
      });
    }
  });

  test('receive exposes both the message and callback roles', () => {
    const receiveBlock = netLua.match(
      /---@\[call_arg\("gmod\.net_message", "receive"\)\][\s\S]*?function net\.Receive\(messageName, callback\) end/,
    )?.[0];

    expect(receiveBlock).toBeDefined();
    expect(receiveBlock).toContain(
      '---@[call_arg("gmod.net_message", "callback")]',
    );
  });

  test('send terminators declare their receiver realm and targets', () => {
    const sends = [
      ...netLua.matchAll(
        /---@\[net_send\("(client|server)"\)\]\nfunction (net\.[^(]+)\(/g,
      ),
    ]
      .map(([, realm, functionName]) => [functionName, realm])
      .sort(([left], [right]) => left.localeCompare(right));

    expect(sends).toEqual([
      ['net.Broadcast', 'client'],
      ['net.Send', 'client'],
      ['net.SendOmit', 'client'],
      ['net.SendPAS', 'client'],
      ['net.SendPVS', 'client'],
      ['net.SendToServer', 'server'],
    ]);

    const targetFunctions = [
      ...netLua.matchAll(/((?:---[^\n]*\n)+)function (net\.[^(]+)\(/g),
    ]
      .filter(([, docs]) =>
        docs.includes('call_arg("gmod.net_payload", "target")'),
      )
      .map(([, , functionName]) => functionName)
      .sort();

    expect(targetFunctions).toEqual([
      'net.Send',
      'net.SendOmit',
      'net.SendPAS',
      'net.SendPVS',
    ]);
  });
});
