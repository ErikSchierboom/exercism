module Raindrops
  FACTORS_TO_SOUNDS = { 3 => 'Pling', 5 => 'Plang', 7 => 'Plong' }.freeze

  def self.convert(number)
    sounds = FACTORS_TO_SOUNDS.map do |factor, sound|
      sound if (number % factor).zero?
    end.join

    sounds.empty? ? number.to_s : sounds
  end
end