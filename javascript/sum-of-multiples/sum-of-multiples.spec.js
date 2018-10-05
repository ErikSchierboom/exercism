import SumOfMultiples from './sum-of-multiples';

describe('SumOfMultiples', () => {
  test('to 1', () => {
    expect(SumOfMultiples([3, 5]).to(1)).toBe(0);
  });

  test('to 3', () => {
    expect(SumOfMultiples([3, 5]).to(4)).toBe(3);
  });

  test('to 10', () => {
    expect(SumOfMultiples([3, 5]).to(10)).toBe(23);
  });

  test('to 100', () => {
    expect(SumOfMultiples([3, 5]).to(100)).toBe(2318);
  });

  test('to 1000', () => {
    expect(SumOfMultiples([3, 5]).to(1000)).toBe(233168);
  });

  test('[7, 13, 17] to 20', () => {
    expect(SumOfMultiples([7, 13, 17]).to(20)).toBe(51);
  });

  test('[4, 6] to 15', () => {
    expect(SumOfMultiples([4, 6]).to(15)).toBe(30);
  });

  test('[5, 6, 8] to 150', () => {
    expect(SumOfMultiples([5, 6, 8]).to(150)).toBe(4419);
  });

  test('[43, 47] to 10000', () => {
    expect(SumOfMultiples([43, 47]).to(10000)).toBe(2203160);
  });
});
