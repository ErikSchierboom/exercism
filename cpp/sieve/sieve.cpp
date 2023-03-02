#include <vector>
#include "sieve.h"

namespace sieve
{
    std::vector<int> primes(int max)
    {
        std::vector<bool> sieve(max + 1, true);

        for (int i = 2; i <= max; i++)
        {
            if (!sieve[i])
                continue;

            for (int j = i * 2; j <= max; j += i)
                sieve[j] = false;
        }

        std::vector<int> primes;

        for (int k = 2; k <= max; k++) {
            if (sieve[k])
                primes.push_back(k);
        }

        return primes;
    }
} // namespace sieve
