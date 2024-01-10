import { primeFactors } from "./prime-factors";

describe("returns prime factors for the given input number", () => {
  test("no factors", () => expect(primeFactors(1)).toEqual([]));

  test("prime number", () => expect(primeFactors(2)).toEqual([2]));

  test("another prime number", () => expect(primeFactors(3)).toEqual([3]));

  test("square of a prime", () => expect(primeFactors(9)).toEqual([3, 3]));

  test("product of first prime", () => expect(primeFactors(4)).toEqual([2, 2]));

  test("cube of a prime", () => expect(primeFactors(8)).toEqual([2, 2, 2]));

  test("product of second prime", () =>
    expect(primeFactors(27)).toEqual([3, 3, 3]));

  test("product of third prime", () =>
    expect(primeFactors(625)).toEqual([5, 5, 5, 5]));

  test("product of first prime and second prime", () =>
    expect(primeFactors(6)).toEqual([2, 3]));

  test("product of primes and non-primes", () =>
    expect(primeFactors(12)).toEqual([2, 2, 3]));

  test("product of primes", () =>
    expect(primeFactors(901255)).toEqual([5, 17, 23, 461]));

  test("factors include a large prime", () =>
    expect(primeFactors(93819012551)).toEqual([11, 9539, 894119]));
});
