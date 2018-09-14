import Ocr from './ocr-numbers';
const ocr = new Ocr();

describe('ocr', () => {
  test('recognizes zero', () => {
    expect(ocr.convert(
      ' _ \n' +
      '| |\n' +
      '|_|\n' +
      '   ',
    )).toBe('0');
  });

  xtest('recognizes one', () => {
    expect(ocr.convert(
      '   \n' +
      '  |\n' +
      '  |\n' +
      '   ',
    )).toBe('1');
  });

  xtest('recognizes two', () => {
    expect(ocr.convert(
      ' _ \n' +
      ' _|\n' +
      '|_ \n' +
      '   ',
    )).toBe('2');
  });

  xtest('recognizes three', () => {
    expect(ocr.convert(
      ' _ \n' +
      ' _|\n' +
      ' _|\n' +
      '   ',
    )).toBe('3');
  });

  xtest('recognizes four', () => {
    expect(ocr.convert(
      '   \n' +
      '|_|\n' +
      '  |\n' +
      '   ',
    )).toBe('4');
  });

  xtest('recognizes five', () => {
    expect(ocr.convert(
      ' _ \n' +
      '|_ \n' +
      ' _|\n' +
      '   ',
    )).toBe('5');
  });

  xtest('recognizes six', () => {
    expect(ocr.convert(
      ' _ \n' +
      '|_ \n' +
      '|_|\n' +
      '   ',
    )).toBe('6');
  });

  xtest('recognizes seven', () => {
    expect(ocr.convert(
      ' _ \n' +
      '  |\n' +
      '  |\n' +
      '   ',
    )).toBe('7');
  });

  xtest('recognizes eight', () => {
    expect(ocr.convert(
      ' _ \n' +
      '|_|\n' +
      '|_|\n' +
      '   ',
    )).toBe('8');
  });

  xtest('recognizes nine', () => {
    expect(ocr.convert(
      ' _ \n' +
      '|_|\n' +
      ' _|\n' +
      '   ',
    )).toBe('9');
  });

  xtest('recognizes ten', () => {
    expect(ocr.convert(
      '    _ \n' +
      '  || |\n' +
      '  ||_|\n' +
      '      ',
    )).toBe('10');
  });

  xtest('identifies garble', () => {
    expect(ocr.convert(
      '   \n' +
      '| |\n' +
      '| |\n' +
      '   ',
    )).toBe('?');
  });

  xtest('converts 110101100', () => {
    expect(ocr.convert(
      '       _     _        _  _ \n' +
      '  |  || |  || |  |  || || |\n' +
      '  |  ||_|  ||_|  |  ||_||_|\n' +
      '                           ',
    )).toBe('110101100');
  });

  xtest('identifies garble mixed in', () => {
    expect(ocr.convert(
      '       _     _           _ \n' +
      '  |  || |  || |     || || |\n' +
      '  |  | _|  ||_|  |  ||_||_|\n' +
      '                           ',
    )).toBe('11?10?1?0');
  });

  xtest('converts 1234567890', () => {
    expect(ocr.convert(
      '    _  _     _  _  _  _  _  _ \n' +
      '  | _| _||_||_ |_   ||_||_|| |\n' +
      '  ||_  _|  | _||_|  ||_| _||_|\n' +
      '                              ',
    )).toBe('1234567890');
  });

  xtest('converts 123 456 789', () => {
    expect(ocr.convert(
      '    _  _ \n' +
      '  | _| _|\n' +
      '  ||_  _|\n' +
      '         \n' +
      '    _  _ \n' +
      '|_||_ |_ \n' +
      '  | _||_|\n' +
      '         \n' +
      ' _  _  _ \n' +
      '  ||_||_|\n' +
      '  ||_| _|\n' +
      '         ',
    )).toBe('123,456,789');
  });
});
