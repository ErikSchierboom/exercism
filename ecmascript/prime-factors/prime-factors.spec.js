import PrimeFactors from './prime-factors';
const primeFactors = new PrimeFactors();

describe('primeFactors', () => {

  it('returns an empty array for 1', () => expect(primeFactors.for(1)).toEqual([]));

  it('factors 2', () => expect(primeFactors.for(2)).toEqual([2]));

  it('factors 3', () => expect(primeFactors.for(3)).toEqual([3]));

  it('factors 4', () => expect(primeFactors.for(4)).toEqual([2, 2]));

  it('factors 6', () => expect(primeFactors.for(6)).toEqual([2, 3]));

  it('factors 8', () => expect(primeFactors.for(8)).toEqual([2, 2, 2]));

  it('factors 9', () => expect(primeFactors.for(9)).toEqual([3, 3]));

  it('factors 27', () => expect(primeFactors.for(27)).toEqual([3, 3, 3]));

  it('factors 625', () => expect(primeFactors.for(625)).toEqual([5, 5, 5, 5]));

  it('factors 901255', () => expect(primeFactors.for(901255)).toEqual([5, 17, 23, 461]));

  it('factors 93819012551', () => expect(primeFactors.for(93819012551)).toEqual([11, 9539, 894119]));

});
