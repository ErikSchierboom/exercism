module Raindrops
  FACTORS_TO_SOUNDS = { 3 => 'Pling', 5 => 'Plang', 7 => 'Plong' }.freeze

  def self.convert(number)
    sounds = FACTORS_TO_SOUNDS.filter_map { |factor, sound| sound if number.remainder(factor).zero? }
    sounds.empty? ? number.to_s : sounds.join
  end
end