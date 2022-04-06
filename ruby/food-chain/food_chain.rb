require "ostruct"

module FoodChain
  def self.song = 1.upto(NUMBER_OF_VERSES).collect(&Verse.method(:lyrics)).join($/)

  NUMBER_OF_VERSES = 8
  private_constant :NUMBER_OF_VERSES
end

class Verse
  def self.lyrics(number) = new(number).lyrics

  attr_reader :number, :subject

  def initialize(number)
    @number = number
    @subject = SUBJECTS[number - 1]
  end

  def lyrics = [fact, subject.embellishment, swallows, subject.conclusion].compact.join($/) + $/

  private

  def fact = "I know an old lady who swallowed a #{subject.subject}."

  def swallows
    return if subject.embellishment.nil?

    number.downto(2).map {|n| "She swallowed the #{SUBJECTS[n - 1].subject} to catch the #{SUBJECTS[n - 2].subject}#{SUBJECTS[n - 2].addition}."}.join($/)
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
