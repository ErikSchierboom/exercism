function isSilent(text) {
    return text ~ "^[[:space:]]*$"
}

function isQuestion(text) {
    return text ~ "\\?[[:space:]]*$"
}

function isShout(text) {
    return text ~ "[[:upper:]]" && text !~ "[[:lower:]]"
}

BEGIN {
    RS = "\034"
}

isSilent($0) { 
    print "Fine. Be that way!"
    next
}

isShout($0) && isQuestion($0) { 
    print "Calm down, I know what I'm doing!"
    next
}

isQuestion($0) { 
    print "Sure."
    next
}

isShout($0) {
    print "Whoa, chill out!"
    next
}

{ 
    print "Whatever." 
}

END {
    if (NR == 0) 
        print "Fine. Be that way!"
}
