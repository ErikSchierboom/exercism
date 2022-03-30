# frozen_string_literal: true

module FoodChain
  def self.song
    (1..NUMBER_OF_VERSES).map { |n| verse(n) }.join("\n\n") + "\n"
  end

  def self.verse_begin(number)
    case number
    when 1
      ['I know an old lady who swallowed a fly.']
    when 8
      ['I know an old lady who swallowed a horse.']
    else
      (subject, followup) = SUBJECTS[number - 2]
      ["I know an old lady who swallowed a #{subject}.", followup]
    end
  end

  def self.verse_end(number)
    if number == 8
      ["She's dead, of course!"]
    else
      HISTORY.drop(HISTORY.size - number).take(number)
    end
  end

  def self.verse(number)
    verse_begin(number).concat(verse_end(number)).join("\n")
  end

  SUBJECTS = [
    ['spider', 'It wriggled and jiggled and tickled inside her.'],
    ['bird',   'How absurd to swallow a bird!'],
    ['cat',    'Imagine that, to swallow a cat!'],
    ['dog',    'What a hog, to swallow a dog!'],
    ['goat',   'Just opened her throat and swallowed a goat!'],
    ['cow',    "I don't know how she swallowed a cow!"]
  ].freeze
  HISTORY =
    ["I don't know how she swallowed a cow!",
     'She swallowed the cow to catch the goat.',
     'She swallowed the goat to catch the dog.',
     'She swallowed the dog to catch the cat.',
     'She swallowed the cat to catch the bird.',
     'She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.',
     'She swallowed the spider to catch the fly.',
     "I don't know why she swallowed the fly. Perhaps she'll die."].freeze
  NUMBER_OF_VERSES = 8
  private_constant :SUBJECTS, :HISTORY, :NUMBER_OF_VERSES
end
