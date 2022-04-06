require "ostruct"

module FoodChain
  def self.song = 1.upto(NUMBER_OF_VERSES).collect(&Verse.method(:lyrics)).join($/)

  NUMBER_OF_VERSES = 8
  private_constant :NUMBER_OF_VERSES
end

class Verse
  def self.lyrics(number) = new(number).lyrics

  attr_reader :number, :animal

  def initialize(number)
    @number = number
    @animal = ANIMALS[number - 1]
  end

  def lyrics = [fact, embellishment, swallows, conclusion].compact.join($/) + $/

  private

  def fact = "I know an old lady who swallowed a #{animal.subject}."
  def embellishment = animal.embellishment
  def conclusion = animal.conclusion

  def swallows
    return if animal.embellishment.nil?

    number.downto(2).map {|n| "She swallowed the #{ANIMALS[n - 1].subject} to catch the #{ANIMALS[n - 2].subject}#{ANIMALS[n - 2].addition}."}.join($/)
  end

  ANIMALS = [
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

  private_constant :ANIMALS
end
