module IsbnVerifier
  def self.valid?(isbn)
    checksum = 0
    multiplier = 10

    isbn.each_char do |c|
      next if c == '-'

      return false unless c =~ /^[\dX]+$/
      return false if c == 'X' && multiplier > 1

      digit = c == 'X' ? 10 : c.to_i
      checksum += digit * multiplier
      multiplier -= 1
    end

    return false unless multiplier.zero?

    (checksum % 11).zero?
  end
end
