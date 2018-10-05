import score from './scrabble-score';

describe('Scrabble', () => {
  test('scores an empty word as zero', () => expect(score('')).toEqual(0));

  test('scores a null as zero', () => expect(score(null)).toEqual(0));

  test('scores a very short word', () => expect(score('a')).toEqual(1));

  test('scores the word by the number of letters', () => expect(score('street')).toEqual(6));

  test('scores more complicated words with more', () => expect(score('quirky')).toEqual(22));

  test('scores case insensitive words', () => expect(score('OXYPHENBUTAZONE')).toEqual(41));
});
