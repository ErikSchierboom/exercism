module Raindrops
  def self.convert(number)
    factors_to_sounds = { 3 => 'Pling', 5 => 'Plang', 7 => 'Plong' }
    sounds = factors_to_sounds.map { |factor, sound| sound if number % factor == 0 }.compact
    sounds.empty? ? number.to_s : sounds.join
  end
end