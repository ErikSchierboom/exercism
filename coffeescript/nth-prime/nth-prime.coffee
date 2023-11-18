class NthPrime
  @nth: (nthPrime) ->
    throw new Error('Prime is not possible') if nthPrime < 1

    for prime from NthPrime.primes()
      return prime if nthPrime-- == 1

  @primes: ->
    yield 2
    yield 3

    n = 6

    loop
      yield n - 1 if NthPrime.isPrime(n - 1)
      yield n + 1 if NthPrime.isPrime(n + 1)

      n += 6
    return

  @isPrime: (candidate) ->
    r = Math.floor(Math.sqrt(candidate))
    return true if r < 5

    for i in [5...r + 1] by 2
      return false if candidate % i == 0

    true

module.exports = NthPrime




# export default class Prime {
#     nth(n) {
#         if (n < 1)
#             throw new Error('Prime is not possible');

#         let prime = 0;
#         let p = primes();

#         for (let i = 0; i < n; i++)
#             prime = p.next().value;

#         return prime;
#     }
# }