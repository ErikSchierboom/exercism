{
    distance = sqrt($1^2 + $2^2)
    if (distance <= 1) { print "10" }
    else if (distance <= 5) { print "5" }
    else if (distance <= 10) { print "1" }
    else { print "0" }
}
