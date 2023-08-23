BEGIN {
    FS = "[: \t,]+"
}

{ 
    gsub("\"", "");

    for (i = 2; i <= NF; i++)
        if (tolower($i))
            rows[tolower($i)] = $1
}

END {
    n = asorti(rows, keys)
    for (i = 1; i <= n; i++)
        print keys[i] "," rows[keys[i]]
}
