import generate from './palindrome-products';

describe("Palindrome", function() {

  it("largest palindrome from single digit factors", function() {
    const palindromes = generate({maxFactor: 9});
    const largest = palindromes.largest;

    expect(largest.value).toEqual(9);
    expect([[3, 3], [1, 9]]).toContain(largest.factors);
  });

  it("largest palindrome from double digit factors", function() {
    const palindromes = generate({ maxFactor: 99, minFactor: 10 });
    const largest = palindromes.largest;

    expect(largest.value).toEqual(9009);
    expect(largest.factors).toEqual([91, 99]);
  });

  it("smallest palindrome from double digit factors", function() {
    const palindromes = generate({ maxFactor: 99, minFactor: 10 });
    const smallest = palindromes.smallest;

    expect(smallest.value).toEqual(121);
    expect(smallest.factors).toEqual([11, 11]);
  });

  it("largest palindrome from triple digit factors", function() {
    const palindromes = generate({ maxFactor: 999, minFactor: 100 });
    const largest = palindromes.largest;

    expect(largest.value).toEqual(906609);
    expect(largest.factors).toEqual([913, 993]);
  });

  it("smallest palindrome from triple digit factors", function() {
    const palindromes = generate({ maxFactor: 999, minFactor: 100 });
    const smallest = palindromes.smallest;

    expect(smallest.value).toEqual(10201);
    expect(smallest.factors).toEqual([101, 101]);
  });

});
