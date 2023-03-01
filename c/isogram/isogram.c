#include "isogram.h"

#include <ctype.h>
#include <stdint.h>

bool is_isogram(const char phrase[])
{
    if (!phrase)
        return false;

    int32_t letters_mask = 0;

    for (; *phrase; phrase++)
    {
        if (isalpha(*phrase))
        {
            int32_t letter_mask = 1 << (tolower(*phrase) - 'a');
            if (letters_mask & letter_mask)
                return false;

            letters_mask |= letter_mask;
        }
    }

    return true;
}
