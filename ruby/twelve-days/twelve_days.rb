module TwelveDays
  DAYS = %w[first second third fourth fifth sixth seventh eighth ninth tenth eleventh twelfth].freeze
  COUNTS = %w[a two three four five six seven eight nine ten eleven twelve].freeze
  GIFTS = [
    'Partridge in a Pear Tree',
    'Turtle Doves',
    'French Hens',
    'Calling Birds',
    'Gold Rings',
    'Geese-a-Laying',
    'Swans-a-Swimming',
    'Maids-a-Milking',
    'Ladies Dancing',
    'Lords-a-Leaping',
    'Pipers Piping',
    'Drummers Drumming'
  ].freeze
  private_constant :DAYS, :COUNTS, :GIFTS

  def self.song
    1.upto(DAYS.size)
     .map(&method(:verse))
     .join("\n")
  end

  private

  def self.verse(n)
    "On the #{day(n)} day of Christmas my true love gave to me: #{gifts(n)}.\n"
  end

  def self.gifts(n)
    n.downto(1)
     .map { |n| "#{count(n)} #{gift(n)}" }
     .join(', ')
     .sub(', a', ', and a')
  end

  def self.day(n)
    DAYS[n - 1]
  end

  def self.count(n)
    COUNTS[n - 1]
  end

  def self.gift(n)
    GIFTS[n - 1]
  end
end