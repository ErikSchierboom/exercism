BEGIN { FS = "" }
{ for (i = NF; i > 0; i--) printf $i }
