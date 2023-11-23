PalindromeProducts = require './palindrome-products'

describe 'PalindromeProducts', ->
  it 'find the smallest palindrome from single digit factors', ->
    palindromes = new PalindromeProducts({maxFactor: 9})
    largest = palindromes.smallest()
    expect(largest.value).toEqual(1)
    expect(largest.factors).toEqual([[1, 1]])

  it 'find the largest palindrome from single digit factors', ->
    palindromes = new PalindromeProducts({maxFactor: 9})
    largest = palindromes.largest()
    expect(largest.value).toEqual(9)
    expect([[[3, 3], [1, 9]], [[1, 9], [3, 3]]]).toContain(largest.factors)

  it 'find the smallest palindrome from double digit factors', ->
    palindromes = new PalindromeProducts({ maxFactor: 99, minFactor: 10 })
    smallest = palindromes.smallest()
    expect(smallest.value).toEqual(121)
    expect(smallest.factors).toEqual([[11, 11]])

  it 'find the largest palindrome from double digit factors', ->
    palindromes = new PalindromeProducts({ maxFactor: 99, minFactor: 10 })
    largest = palindromes.largest()
    expect(largest.value).toEqual(9009)
    expect(largest.factors).toEqual([[91, 99]])

  it 'find the smallest palindrome from triple digit factors"', ->
    palindromes = new PalindromeProducts({ maxFactor: 999, minFactor: 100 })
    smallest = palindromes.smallest()
    expect(smallest.value).toEqual(10201)
    expect(smallest.factors).toEqual([[101, 101]])

  it 'find the largest palindrome from triple digit factors', ->
    palindromes = new PalindromeProducts({ maxFactor: 999, minFactor: 100 })
    largest = palindromes.largest()
    expect(largest.value).toEqual(906609)
    expect(largest.factors).toEqual([[913, 993]])

  it 'find the smallest palindrome from four digit factors', ->
    palindromes = new PalindromeProducts({ maxFactor: 9999, minFactor: 1000 })
    smallest = palindromes.smallest()
    expect(smallest.value).toEqual(1002001)
    expect(smallest.factors).toEqual([[1001, 1001]])

  it 'find the largest palindrome from four digit factors"', ->
    palindromes = new PalindromeProducts({ maxFactor: 9999, minFactor: 1000 })
    largest = palindromes.largest()
    expect(largest.value).toEqual(99000099)
    expect(largest.factors).toEqual([[9901, 9999]])
  
  it 'empty result for smallest if no palindrome in the range', ->
    palindromes = new PalindromeProducts({ maxFactor: 1003, minFactor: 1002 })
    smallest = palindromes.smallest()
    expect(smallest.value).toEqual(null)
    expect(smallest.factors).toEqual([])

  it 'empty result for largest if no palindrome in the range', ->
    palindromes = new PalindromeProducts({ maxFactor: 15, minFactor: 15 })
    largest = palindromes.largest()
    expect(largest.value).toEqual(null)
    expect(largest.factors).toEqual([])

  it 'error result for smallest if min is more than max', ->
    palindromes = new PalindromeProducts({ maxFactor: 1, minFactor: 10000 })
    expect(() -> palindromes.smallest()).toThrow(new Error('min must be <= max'))

  it 'error result for largest if min is more than max', ->
    palindromes = new PalindromeProducts({ maxFactor: 1, minFactor: 2 })
    expect(() -> palindromes.largest()).toThrow(new Error('min must be <= max'))

  it 'smallest product does not use the smallest factor', ->
    palindromes = new PalindromeProducts({ maxFactor: 4000, minFactor: 3215 })
    smallest = palindromes.smallest()
    expect(smallest.value).toEqual(10988901)
    expect(smallest.factors).toEqual([[3297, 3333]])
