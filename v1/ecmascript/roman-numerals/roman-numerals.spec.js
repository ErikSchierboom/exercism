import toRoman from './roman-numerals';

describe('toRoman()', () => {
  it('converts 1', () => expect(toRoman(1)).toEqual('I'));
  it('converts 2', () => expect(toRoman(2)).toEqual('II'));
  it('converts 3', () => expect(toRoman(3)).toEqual('III'));
  it('converts 4', () => expect(toRoman(4)).toEqual('IV'));
  it('converts 5', () => expect(toRoman(5)).toEqual('V'));
  it('converts 6', () => expect(toRoman(6)).toEqual('VI'));
  it('converts 9', () => expect(toRoman(9)).toEqual('IX'));
  it('converts 27', () => expect(toRoman(27)).toEqual('XXVII'));
  it('converts 48', () => expect(toRoman(48)).toEqual('XLVIII'));
  it('converts 59', () => expect(toRoman(59)).toEqual('LIX'));
  it('converts 93', () => expect(toRoman(93)).toEqual('XCIII'));
  it('converts 141', () => expect(toRoman(141)).toEqual('CXLI'));
  it('converts 163', () => expect(toRoman(163)).toEqual('CLXIII'));
  it('converts 402', () => expect(toRoman(402)).toEqual('CDII'));
  it('converts 575', () => expect(toRoman(575)).toEqual('DLXXV'));
  it('converts 911', () => expect(toRoman(911)).toEqual('CMXI'));
  it('converts 1024', () => expect(toRoman(1024)).toEqual('MXXIV'));
  it('converts 3000', () => expect(toRoman(3000)).toEqual('MMM'));
});
