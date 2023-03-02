#include "reverse_string.h"

#include <algorithm>

namespace reverse_string {
    std::string reverse_string(std::string input) {
        std::reverse(input.begin(), input.end());
        return input;
    }
}  // namespace reverse_string
