#include <stdexcept>
#include "binary_search.h"

namespace binary_search {
    std::size_t find(const std::vector<int> data, int target) {
        int left = 0;
        int right = data.size() - 1;

        while (left <= right) {
            int middle = (right + left) / 2;

            if (data[middle] == target)
                return middle;

            if (data[middle] < target)
                left = middle + 1;
            else
                right = middle - 1;
        }

        throw std::domain_error("Could not find element");
    }
}  // namespace binary_search
