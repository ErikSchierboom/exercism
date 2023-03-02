#include "raindrops.h"

#include <string>

using namespace std;

namespace raindrops {
    string convert(int n) {
        string result;

        if (n % 3 == 0) result.append("Pling");
        if (n % 5 == 0) result.append("Plang");
        if (n % 7 == 0) result.append("Plong");

        return result.empty() ? to_string(n) : result;
    }
}  // namespace raindrops
