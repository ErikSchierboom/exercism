proc isLeapYear*(year: int): bool =
    year mod 4 == 0 and
    year mod 100 != 0 or
    year mod 400 == 0
