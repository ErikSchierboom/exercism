BEGIN { FS = ""; ORS = "" }

NF == 0 {
    print "series cannot be empty"
    exit 1
}

len > NF || len < 1 {
    print "invalid length"
    exit 1
}

{
    for (i = 1; i <= NF - len + 1; i++) {
        print substr($0, i, len)
        if (i < NF - len + 1)
            print " "
    }
}
