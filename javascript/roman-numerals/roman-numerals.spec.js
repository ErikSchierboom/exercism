import toRoman from './roman-numerals';

describe('toRoman()', () => {
  test('converts 1', () => expect(toRoman(1)).toEqual('I'));
  test('converts 2', () => expect(toRoman(2)).toEqual('II'));
  test('converts 3', () => expect(toRoman(3)).toEqual('III'));
  test('converts 4', () => expect(toRoman(4)).toEqual('IV'));
  test('converts 5', () => expect(toRoman(5)).toEqual('V'));
  test('converts 6', () => expect(toRoman(6)).toEqual('VI'));
  test('converts 9', () => expect(toRoman(9)).toEqual('IX'));
  test('converts 27', () => expect(toRoman(27)).toEqual('XXVII'));
  test('converts 48', () => expect(toRoman(48)).toEqual('XLVIII'));
  test('converts 59', () => expect(toRoman(59)).toEqual('LIX'));
  test('converts 93', () => expect(toRoman(93)).toEqual('XCIII'));
  test('converts 141', () => expect(toRoman(141)).toEqual('CXLI'));
  test('converts 163', () => expect(toRoman(163)).toEqual('CLXIII'));
  test('converts 402', () => expect(toRoman(402)).toEqual('CDII'));
  test('converts 575', () => expect(toRoman(575)).toEqual('DLXXV'));
  test('converts 911', () => expect(toRoman(911)).toEqual('CMXI'));
  test('converts 1024', () => expect(toRoman(1024)).toEqual('MXXIV'));
  test('converts 3000', () => expect(toRoman(3000)).toEqual('MMM'));
});
