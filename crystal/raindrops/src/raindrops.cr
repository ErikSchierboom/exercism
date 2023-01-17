module Raindrops
  FACTORS_TO_SOUNDS = {3 => "Pling", 5 => "Plang", 7 => "Plong"}

  def self.convert(number)
    sounds = FACTORS_TO_SOUNDS.map { |factor, sound| sound if (number % factor).zero? }.compact
    sounds.empty? ? number.to_s : sounds.join
  end
end
