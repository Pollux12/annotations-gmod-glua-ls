import { GluaApiWriter } from '../../src/api-writer/glua-api-writer';

describe('writeType', () => {
  describe('callback functions', () => {
    it('should write parameter names', async () => {
      const result = GluaApiWriter.transformType('function', {
        arguments: [
          { type: 'number', name: 'count' },
          { type: 'string', name: 'total' },
        ],
        returns: [
          { type: 'number', name: 'sum' },
          { type: 'string', name: 'limit' },
        ],
      });

      expect(result).toEqual('fun(count: number, total: string):(sum: number, limit: string)');
    });

    it('should write ret1, ret2, etc when parameter names are missing', async () => {
      const result = GluaApiWriter.transformType('function', {
        arguments: [
          { type: 'number', name: 'count' },
          { type: 'string', name: '' },
        ],
        returns: [
          { type: 'number', name: '' },
          { type: 'string', name: '' },
        ],
      });

      expect(result).toEqual('fun(count: number, arg1: string):(ret0: number, ret1: string)');
    });
  });

  describe('sequential tables', () => {
    it('should convert table<X> to X[]', async () => {
      expect(GluaApiWriter.transformType('table<Player>')).toEqual('Player[]');
    });

    it('should strip the Structures page path from the element type', async () => {
      expect(GluaApiWriter.transformType('table<Structures/LocalLight>')).toEqual('LocalLight[]');
    });

    it('should convert a nested element type', async () => {
      expect(GluaApiWriter.transformType('table<table{Undo}>')).toEqual('Undo[]');
    });

    it('should leave table<x, y> untouched', async () => {
      expect(GluaApiWriter.transformType('table<string, number>')).toEqual('table<string, number>');
    });
  });

  describe('unions', () => {
    it('should keep nil alongside a converted sequential table', async () => {
      expect(GluaApiWriter.transformType('table<Structures/Sky3DParams>|nil')).toEqual('Sky3DParams[]|nil');
    });

    it('should keep nil alongside a converted struct table', async () => {
      expect(GluaApiWriter.transformType('table{AngPos}|nil')).toEqual('AngPos|nil');
    });

    it('should convert members that are not first', async () => {
      expect(GluaApiWriter.transformType('string|table{FormattedTime}')).toEqual('string|FormattedTime');
    });

    it('should leave plain unions untouched', async () => {
      expect(GluaApiWriter.transformType('table|boolean|nil')).toEqual('table|boolean|nil');
    });
  });
});
