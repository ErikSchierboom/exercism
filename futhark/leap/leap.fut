def is_leap (year: i32): bool =
  year % 4 == 0 && (year % 100 != 0 || year % 400 == 0)
