BEGIN { name = "you" }
NF > 0 { name = $0 }
END { print "One for " name ", one for me." }
