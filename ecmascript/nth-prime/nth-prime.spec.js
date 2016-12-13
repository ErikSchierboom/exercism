import Prime from './nth-prime';

describe('Prime', () => {
  const prime = new Prime();

  it('first', () => {
    expect(prime.nth(1)).toEqual(2);
  });

  it('second', () => {
    expect(prime.nth(2)).toEqual(3);
  });

  it('sixth', () => {
    expect(prime.nth(6)).toEqual(13);
  });

  it('big prime', () => {
    expect(prime.nth(10001)).toEqual(104743);
  });

  it('weird case', () => {
    expect(() => prime.nth(0))
      .toThrow(new Error('Prime is not possible'));
  });

});
