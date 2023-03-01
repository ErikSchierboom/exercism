#include <string.h>

#include "hamming.h"

int compute(const char *lhs, const char *rhs)
{
    int lhsLength = strlen(lhs);
    int rhsLength = strlen(rhs);

    if (lhsLength != rhsLength)
        return -1;

    int distance = 0;

    for (int i = 0; i < lhsLength; i++)
    {
        if (lhs[i] != rhs[i])
            distance++;
    }

    return distance;
}
