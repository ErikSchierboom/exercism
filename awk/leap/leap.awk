$1 % 4 == 0 && $1 % 100 != 0 || $1 % 400 == 0 { print "true"; next }
{ print "false" }
