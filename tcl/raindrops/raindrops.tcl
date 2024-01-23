proc raindrops {number} {
    set Pling 3
    set Plang 5
    set Plong 7
    set drops ""
    foreach var [info vars P*] {
        if {$number % [set $var] == 0} {
            append drops $var
        }
    }
    expr {$drops eq "" ? $number : $drops}
}
