"use strict";

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { "default": obj }; }

var _palindromeProducts = require('./palindrome-products');

var _palindromeProducts2 = _interopRequireDefault(_palindromeProducts);

describe("Palindrome", function () {

  it("largest palindrome from single digit factors", function () {
    var palindromes = (0, _palindromeProducts2["default"])({ maxFactor: 9 });
    var largest = palindromes.largest;

    expect(largest.value).toEqual(9);
    expect([[3, 3], [1, 9]]).toContain(largest.factors);
  });

  it("largest palindrome from double digit factors", function () {
    var palindromes = (0, _palindromeProducts2["default"])({ maxFactor: 99, minFactor: 10 });
    var largest = palindromes.largest;

    expect(largest.value).toEqual(9009);
    expect(largest.factors).toEqual([91, 99]);
  });

  it("smallest palindrome from double digit factors", function () {
    var palindromes = (0, _palindromeProducts2["default"])({ maxFactor: 99, minFactor: 10 });
    var smallest = palindromes.smallest;

    expect(smallest.value).toEqual(121);
    expect(smallest.factors).toEqual([11, 11]);
  });

  it("largest palindrome from triple digit factors", function () {
    var palindromes = (0, _palindromeProducts2["default"])({ maxFactor: 999, minFactor: 100 });
    var largest = palindromes.largest;

    expect(largest.value).toEqual(906609);
    expect(largest.factors).toEqual([913, 993]);
  });

  it("smallest palindrome from triple digit factors", function () {
    var palindromes = (0, _palindromeProducts2["default"])({ maxFactor: 999, minFactor: 100 });
    var smallest = palindromes.smallest;

    expect(smallest.value).toEqual(10201);
    expect(smallest.factors).toEqual([101, 101]);
  });
});