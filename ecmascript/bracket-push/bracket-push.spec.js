import bracket from './bracket-push';

describe('bracket push', () => {
  it('checks for appropriate bracketing in a set of brackets', () => {
    expect(bracket('{}')).toEqual(true);
  });

  it('returns false for unclosed brackets', () => {
    expect(bracket('{{')).toEqual(false);
  });

  it('returns false if brackets are out of order', () => {
    expect(bracket('}{')).toEqual(false);
  });

  it('checks bracketing in more than one pair of brackets', () => {
    expect(bracket('{}[]')).toEqual(true);
  });

  it('checks bracketing in nested brackets', () => {
    expect(bracket('{[]}')).toEqual(true);
  });

  it('rejects brackets that are properly balanced but improperly nested', () => {
    expect(bracket('{[}]')).toEqual(false);
  });

  it('checks bracket closure with deeper nesting', () => {
    expect(bracket('{[)][]}')).toEqual(false);
  });

  it('checks bracket closure in a long string of brackets', () => {
    expect(bracket('{[]([()])}')).toEqual(true);
  });
});
