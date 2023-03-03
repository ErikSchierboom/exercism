#if !defined(BINARY_SEARCH_H)
#define BINARY_SEARCH_H

#include <cstddef>
#include <vector>

namespace binary_search {
    std::size_t find(const std::vector<int> data, int target);
}  // namespace binary_search

#endif // BINARY_SEARCH_H