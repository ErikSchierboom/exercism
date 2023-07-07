#include "grains.h"

#include <limits>

namespace grains
{
    unsigned long long square(const int number)
    {
        return 1ull << (number - 1);
    }

    unsigned long long total()
    {
        return std::numeric_limits<unsigned long long>::max();
    }
} // namespace grains
