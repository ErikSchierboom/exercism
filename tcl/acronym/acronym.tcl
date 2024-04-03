proc abbreviate {phrase} {
    set words [regexp -all -inline {[A-Z][A-Z']*} [string toupper $phrase]]
    return [join $words ""]
}
