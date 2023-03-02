#include "raindrops.h"

#include <string>

namespace raindrops
{
    std::string convert(int n)
    {
        std::string result;

        if (n % 3 == 0)
            result.append("Pling");
        if (n % 5 == 0)
            result.append("Plang");
        if (n % 7 == 0)
            result.append("Plong");

        return result.empty() ? std::to_string(n) : result;
    }
} // namespace raindrops
