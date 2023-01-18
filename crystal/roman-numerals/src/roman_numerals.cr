struct Int32
  def to_roman
    remainder = self
    numerals = [] of String

    NUMERAL_THRESHOLDS.each_with_object("") do |(threshold, numeral)|
      while remainder // threshold > 0
        remainder -= threshold
        numerals << numeral
      end
    end

    numerals.join
  end

  NUMERAL_THRESHOLDS = {
    1000 => "M",
     900 => "CM",
     500 => "D",
     400 => "CD",
     100 => "C",
      90 => "XC",
      50 => "L",
      40 => "XL",
      10 => "X",
       9 => "IX",
       5 => "V",
       4 => "IV",
       1 => "I",
  }
end
