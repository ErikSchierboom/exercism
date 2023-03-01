#include "grains.h"

uint64_t square(uint8_t index)
{
    if (index < 1 || index > 64)
        return 0;

    return 1ul << (index - 1);
}

uint64_t total(void)
{
    return (1ul << 63ul << 1ul) - 1;
}
