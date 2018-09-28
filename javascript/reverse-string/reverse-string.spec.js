import reverseString from './reverse-string';

describe('ReverseString', () => {
  test('empty string', () => {
    const expected = '';
    const actual = reverseString('');
    expect(actual).toEqual(expected);
  });

  test('a word', () => {
    const expected = 'tobor';
    const actual = reverseString('robot');
    expect(actual).toEqual(expected);
  });

  test('a capitalized word', () => {
    const expected = 'nemaR';
    const actual = reverseString('Ramen');
    expect(actual).toEqual(expected);
  });

  test('a sentence with punctuation', () => {
    const expected = '!yrgnuh ma I';
    const actual = reverseString('I am hungry!');
    expect(actual).toEqual(expected);
  });

  test('a palindrome', () => {
    const expected = 'racecar';
    const actual = reverseString('racecar');
    expect(actual).toEqual(expected);
  });
});
