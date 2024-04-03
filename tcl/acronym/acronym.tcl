proc abbreviate {phrase} {
    set words [regexp -all -inline {[A-Z][A-Z']*} [string toupper $phrase]]
    set initials [lmap word $words {string range $word 0 0}]
    return [join $initials ""]
}
