BEGIN { FS = "" }

{
    gsub(" ", "")
    size = NF

    if (NF <= 1) {
        print "false"
        exit
    }

    sum = 0

    for (i = 1; i <= size; i++) {
        j = size - i + 1
        digit = i % 2 == 0 ? $j * 2 : $j
        if (digit > 9)
            digit -= 9

        sum += digit
    }

    print sum % 10 == 0 ? "true" : "false"
}
