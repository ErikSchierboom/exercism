module PerfectNumbers
  def self.classify(num : Number) : String
    raise ArgumentError.new unless num.positive?

    case aliquot_sum(num) <=> num
    when .negative? then "deficient"
    when .positive? then "abundant"
    else                 "perfect"
    end
  end

  def self.aliquot_sum(num)
    1.upto(num // 2).select { |n| num.remainder(n).zero? }.sum
  end
end
