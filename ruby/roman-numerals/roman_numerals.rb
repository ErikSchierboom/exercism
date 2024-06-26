class Numeric
  def to_roman
    remainder = self

    NUMERAL_THRESHOLDS.each_with_object([]) do |(threshold, numeral), numerals|
      while remainder / threshold > 0
        remainder -= threshold
        numerals << numeral
      end
    end.join
  end

  private
  NUMERAL_THRESHOLDS = {
    1000 =>  'M',
     900 => 'CM',
     500 =>  'D',
     400 => 'CD',
     100 =>  'C',
      90 => 'XC',
      50 =>  'L',
      40 => 'XL',
      10 =>  'X',
       9 => 'IX',
       5 =>  'V',
       4 => 'IV',
       1 =>  'I'
  }.freeze
  private_constant :NUMERAL_THRESHOLDS
end