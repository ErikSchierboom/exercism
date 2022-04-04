require "ostruct"

module FoodChain
  def self.song = 1.upto(NUMBER_OF_VERSES).map(&Verse.method(:new)).join($/)

  class Verse
    def initialize(number) = @number = number

    def to_s = [fact, SUBJECTS[number - 1].embellishment, swallows, SUBJECTS[number - 1].conclusion].compact.join($/) + $/

    private

    attr_reader :number

    def fact = "I know an old lady who swallowed a #{SUBJECTS[number - 1].subject}."
    def swallows
      return if number == 8 || number == 1

      (number - 1).downto(1).map {|n| "She swallowed the #{SUBJECTS[n].subject} to catch the #{SUBJECTS[n - 1].subject}#{SUBJECTS[n - 1].addition}."}.join($/)
    end

    SUBJECTS = [
      ['fly', nil, nil, nil],
      ['spider', 'It wriggled and jiggled and tickled inside her.', nil, ' that wriggled and jiggled and tickled inside her'],
      ['bird', 'How absurd to swallow a bird!', nil, nil],
      ['cat', 'Imagine that, to swallow a cat!', nil, nil],
      ['dog', 'What a hog, to swallow a dog!', nil, nil],
      ['goat', 'Just opened her throat and swallowed a goat!', nil, nil],
      ['cow', 'I don\'t know how she swallowed a cow!', nil, nil],
      ['horse', nil, 'She\'s dead, of course!', nil]
    ].map do |subject, embellishment, conclusion, addition|
      OpenStruct.new(subject:, embellishment:, conclusion: conclusion || "I don't know why she swallowed the fly. Perhaps she'll die.", addition:)
    end.freeze

    private_constant :SUBJECTS
  end

  NUMBER_OF_VERSES = 8
  private_constant :NUMBER_OF_VERSES
end
