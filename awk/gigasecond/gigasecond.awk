BEGIN { FS = "[-:T]"; Gigasecond = 1000000000 }

{
    current_date = mktime(sprintf("%04d %02d %02d %02d %02d %02d", $1, $2, $3, $4, $5, $6), 1)
    print strftime("%Y-%m-%dT%H:%M:%S", current_date + Gigasecond, 1) 
}

