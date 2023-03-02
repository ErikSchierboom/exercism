#include <vector>
#include "sieve.h"

namespace sieve
{
    std::vector<int> primes(int max)
    {
        std::vector<bool> sieve(max + 1, true);
        std::vector<int> primes;

        for (int i = 2; i <= max; i++)
        {
            if (!sieve[i])
                continue;

            primes.push_back(i);

            for (int j = i * 2; j <= max; j += i)
                sieve[j] = false;
        }

        return primes;
    }
} // namespace sieve
