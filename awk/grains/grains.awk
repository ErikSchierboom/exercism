/total/ { print (2 ^ 64 - 1); next }
$0 < 1 || $0 > 64 { print "square must be between 1 and 64"; exit 1 }
{ print 2 ^ ($0 - 1) }
