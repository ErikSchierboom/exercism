pub fn convert(number: Int) -> String {
  do_convert(number, "")
}

fn do_convert(number: Int, numeral: String) -> String {
  case number {
    _ if number >= 1000 -> do_convert(number - 1000, numeral <> "M")
    _ if number >= 900 -> do_convert(number - 900, numeral <> "CM")
    _ if number >= 500 -> do_convert(number - 500, numeral <> "D")
    _ if number >= 400 -> do_convert(number - 400, numeral <> "CD")
    _ if number >= 100 -> do_convert(number - 100, numeral <> "C")
    _ if number >= 90 -> do_convert(number - 90, numeral <> "XC")
    _ if number >= 50 -> do_convert(number - 50, numeral <> "L")
    _ if number >= 40 -> do_convert(number - 40, numeral <> "XL")
    _ if number >= 10 -> do_convert(number - 10, numeral <> "X")
    _ if number >= 9 -> do_convert(number - 9, numeral <> "IX")
    _ if number >= 5 -> do_convert(number - 5, numeral <> "V")
    _ if number >= 4 -> do_convert(number - 4, numeral <> "IV")
    _ if number >= 1 -> do_convert(number - 1, numeral <> "I")
    _ -> numeral
  }
}
