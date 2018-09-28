import PerfectNumbers from './perfect-numbers';

describe('Exercise - Perfect Numbers', () => {
  const perfectNumbers = new PerfectNumbers();

  describe('Perfect Numbers', () => {
    test('Smallest perfect number is classified correctly', () => {
      expect(perfectNumbers.classify(6)).toEqual('perfect');
    });

    test('Medium perfect number is classified correctly', () => {
      expect(perfectNumbers.classify(28)).toEqual('perfect');
    });

    test('Large perfect number is classified correctly', () => {
      expect(perfectNumbers.classify(33550336)).toEqual('perfect');
    });
  });

  describe('Abundant Numbers', () => {
    test('Smallest abundant number is classified correctly', () => {
      expect(perfectNumbers.classify(12)).toEqual('abundant');
    });

    test('Medium abundant number is classified correctly', () => {
      expect(perfectNumbers.classify(30)).toEqual('abundant');
    });

    test('Large abundant number is classified correctly', () => {
      expect(perfectNumbers.classify(33550335)).toEqual('abundant');
    });
  });

  describe('Deficient Numbers', () => {
    test('Smallest prime deficient number is classified correctly', () => {
      expect(perfectNumbers.classify(2)).toEqual('deficient');
    });

    test('Smallest non-prime deficient number is classified correctly', () => {
      expect(perfectNumbers.classify(4)).toEqual('deficient');
    });

    test('Medium deficient number is classified correctly', () => {
      expect(perfectNumbers.classify(32)).toEqual('deficient');
    });

    test('Large deficient number is classified correctly', () => {
      expect(perfectNumbers.classify(33550337)).toEqual('deficient');
    });

    test('Edge case (no factors other than itself) is classified correctly', () => {
      expect(perfectNumbers.classify(1)).toEqual('deficient');
    });
  });

  describe('Invalid Inputs', () => {
    test('Zero is rejected (not a natural number)', () => {
      expect(() => perfectNumbers.classify(0))
        .toThrow('Classification is only possible for natural numbers.');
    });

    test('Negative integer is rejected (not a natural number)', () => {
      expect(() => perfectNumbers.classify(-1))
        .toThrow('Classification is only possible for natural numbers.');
    });
  });
});
