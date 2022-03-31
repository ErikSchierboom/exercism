module FoodChain
  def self.song = NUMBER_OF_VERSES.times.map { |n| Verse.new(n + 1) }.join($/)

  class Verse
    def initialize(number)
      @number = number
    end

    def to_s
      <<~VERSE
        #{fact}
        #{conclusion}
      VERSE
    end

    private

    attr_reader :number

    def fact = "I know an old lady who swallowed a #{subject}.#{$/}#{comment}".strip

    def subject = SUBJECTS[number - 1][0]

    def comment = SUBJECTS[number - 1][1]

    def conclusion
      if number == 8
        "She's dead, of course!"
      else
        HISTORY[-number..].join($/)
      end
    end

    SUBJECTS = [
      ['fly', nil],
      ['spider', 'It wriggled and jiggled and tickled inside her.'],
      ['bird', 'How absurd to swallow a bird!'],
      ['cat', 'Imagine that, to swallow a cat!'],
      ['dog', 'What a hog, to swallow a dog!'],
      ['goat', 'Just opened her throat and swallowed a goat!'],
      ['cow', 'I don\'t know how she swallowed a cow!'],
      ['horse', nil]
    ].freeze
    HISTORY = [
      "I don't know how she swallowed a cow!",
      'She swallowed the cow to catch the goat.',
      'She swallowed the goat to catch the dog.',
      'She swallowed the dog to catch the cat.',
      'She swallowed the cat to catch the bird.',
      'She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.',
      'She swallowed the spider to catch the fly.',
      "I don't know why she swallowed the fly. Perhaps she'll die."
    ].freeze

    private_constant :SUBJECTS, :HISTORY
  end

  NUMBER_OF_VERSES = 8
  private_constant :NUMBER_OF_VERSES
end
