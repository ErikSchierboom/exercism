class Palindrome
  constructor: (@value, @factors) ->

class PalindromeProducts
  constructor: (args) ->
    @maxFactor = args.maxFactor ? args.minFactor
    @minFactor = args.minFactor ? 1
  
  smallest: ->
    throw new Error('min must be <= max') if @minFactor > @maxFactor

    palindrome = new Palindrome null, []

    for [x, y, product] from this.palindromeProducts()
      continue if (palindrome.value ? Number.MAX_VALUE) < product

      if product < (palindrome.value ? Number.MAX_VALUE)
        palindrome.factors = [[x, y]]
        palindrome.value = product
      else      
        palindrome.factors.push([x, y])

    palindrome

  largest: ->
    throw new Error('min must be <= max') if @minFactor > @maxFactor

    palindrome = new Palindrome null, []

    for [x, y, product] from this.palindromeProducts()
        continue if (palindrome.value ? Number.MIN_VALUE) > product

        if product > (palindrome.value ? Number.MIN_VALUE)
          palindrome.factors = [[x, y]]
          palindrome.value = product
        else      
          palindrome.factors.push([x, y])

    palindrome

  palindromeProducts: ->
    for x in [@minFactor..@maxFactor]
      for y in [x..@maxFactor]
        product = x * y
        yield [x, y, product] if this.isPalindrome product

  isPalindrome: (num) ->
    n = num
    rev = 0
    while n > 0
        dig = n % 10
        rev = rev * 10 + dig
        n = n // 10

    num == rev

module.exports = PalindromeProducts
