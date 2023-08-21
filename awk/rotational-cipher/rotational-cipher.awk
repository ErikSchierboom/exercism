#!/usr/bin/env gawk -f

@load "ordchr"

BEGIN { FS = "" }

{
    for (i = 1; i <= NF; i++) {
        ordinal = ord($i)

        if (ordinal >= 65 && ordinal <= 96)
            printf chr(65 + ((ordinal - 65 + distance) % 26))
        else if (ordinal >= 97 && ordinal <= 122)
            printf chr(97 + ((ordinal - 97 + distance) % 26))
        else
            printf $i
    }
}
