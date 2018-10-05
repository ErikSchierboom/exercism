import Hamming from './hamming';

describe('Hamming', () => {
  const hamming = new Hamming();

  test('no difference between identical strands', () => {
    expect(hamming.compute('A', 'A')).toEqual(0);
  });

  test('complete hamming distance for single nucleotide strand', () => {
    expect(hamming.compute('A', 'G')).toEqual(1);
  });

  test('complete hamming distance for small strand', () => {
    expect(hamming.compute('AG', 'CT')).toEqual(2);
  });

  test('small hamming distance', () => {
    expect(hamming.compute('AT', 'CT')).toEqual(1);
  });

  test('small hamming distance in longer strand', () => {
    expect(hamming.compute('GGACG', 'GGTCG')).toEqual(1);
  });

  test('large hamming distance', () => {
    expect(hamming.compute('GATACA', 'GCATAA')).toEqual(4);
  });

  test('hamming distance in very long strand', () => {
    expect(hamming.compute('GGACGGATTCTG', 'AGGACGGATTCT')).toEqual(9);
  });

  test('throws error when strands are not equal length', () => {
    expect(() => hamming.compute('GGACGGATTCTG', 'AGGAC')).toThrow(
      new Error('DNA strands must be of equal length.'),
    );
  });
});
