#include "eliuds_eggs.h"

#define MAGIC_MUL 0x1001001001001ULL
#define MAGIC_AND 0x84210842108421ULL
#define MAGIC_MOD 0x1f

namespace chicken_coop
{
    unsigned int positions_to_quantity(unsigned int v)
    {
        unsigned int c = ((v & 0xfff) * MAGIC_MUL & MAGIC_AND) % MAGIC_MOD;
        c += (((v & 0xfff000) >> 12) * MAGIC_MUL & MAGIC_AND) % MAGIC_MOD;
        c += ((v >> 24) * MAGIC_MUL & MAGIC_AND) % MAGIC_MOD;

        return c;
    }
} // namespace chicken_coop
