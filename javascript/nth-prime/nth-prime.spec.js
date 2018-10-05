import Prime from './nth-prime';

describe('Prime', () => {
  const prime = new Prime();

  test('first', () => {
    expect(prime.nth(1)).toEqual(2);
  });

  test('second', () => {
    expect(prime.nth(2)).toEqual(3);
  });

  test('sixth', () => {
    expect(prime.nth(6)).toEqual(13);
  });

  test('big prime', () => {
    expect(prime.nth(10001)).toEqual(104743);
  });

  test('weird case', () => {
    expect(() => prime.nth(0))
      .toThrow(new Error('Prime is not possible'));
  });
});
