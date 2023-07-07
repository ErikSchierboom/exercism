#include "armstrong_numbers.h"

#include <string>
#include <vector>
#include <numeric>
#include <math.h>

namespace armstrong_numbers
{
  std::vector<int> to_digits(int number)
  {
    std::vector<int> digits;

    while (number != 0)
    {
      auto last = number % 10;
      digits.push_back(last);
      number /= 10;
    }

    return digits;
  }

  bool is_armstrong_number(int number)
  {
    auto digits = to_digits(number);

    auto armstrong_sum =
        std::accumulate(digits.begin(), digits.end(), 0, [digits](int a, int b)
                        { return a + (int)pow(b, digits.size()); });

    return armstrong_sum == number;
  }
} // namespace armstrong_numbers
