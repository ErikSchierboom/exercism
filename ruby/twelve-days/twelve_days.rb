module TwelveDays
  NUMBERS = %w[a two three four five six seven eight nine ten eleven twelve].freeze
  COUNTS = %w[first second third fourth fifth sixth seventh eighth ninth tenth eleventh twelfth].freeze
  SUBJECTS = [
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
  private_constant :NUMBERS, :COUNTS, :SUBJECTS

  def self.song
    1.upto(SUBJECTS.size)
     .map(&method(:verse))
     .join("\n")
  end

  private

  def self.verse(verse_number)
    format("%<begin>s%<end>s.\n", begin: verse_begin(verse_number), end: verse_end(verse_number))
  end

  def self.verse_begin(verse_number)
    format('On the %<count>s day of Christmas my true love gave to me: ', count: COUNTS[verse_number - 1])
  end

  def self.verse_end(verse_number)
    verse_number
      .downto(1)
      .map(&method(:subject))
      .join(', ')
      .sub(', a', ', and a')
  end

  def self.subject(verse_number)
    format('%<number>s %<subject>s', number: NUMBERS[verse_number - 1], subject: SUBJECTS[verse_number - 1])
  end
end