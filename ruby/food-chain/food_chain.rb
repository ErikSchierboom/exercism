module FoodChain
  def self.song = 1.upto(NUMBER_OF_VERSES).map(&Verse.method(:lyrics)).join($/)

  NUMBER_OF_VERSES = 8
  private_constant :NUMBER_OF_VERSES
end

class Verse
  def self.lyrics(number) = self.for(number).lyrics

  def self.for(number)
    case number
    when 1
      FirstVerse
    when 8
      LastVerse
    else
      self
    end.new(number)
  end

  attr_reader :number

  def initialize(number) = @number = number

  def lyrics = [fact, embellishment, history, conclusion].compact.join($/) + $/
  def fact = "I know an old lady who swallowed a #{animal.name}."
  def conclusion = "I don't know why she swallowed the fly. Perhaps she'll die."
  def embellishment = animal.embellishment

  def history =
    number
      .downto(1)
      .each_cons(2)
      .map {|swallowed_idx, caught_idx| "She swallowed the #{Animal.for(swallowed_idx).name} to catch the #{Animal.for(caught_idx).name_with_description}."}
      .join($/)

  def animal = Animal.for(number)
end

class FirstVerse < Verse
  def embellishment = nil
  def history = nil
end

class LastVerse < Verse
  def embellishment = nil
  def history = nil
  def conclusion = 'She\'s dead, of course!'
end

class Animal
  def self.for(number) = new(*ANIMALS[number - 1])

  attr_reader :name, :embellishment, :description

  def initialize(name, embellishment, description)
    @name = name
    @embellishment = embellishment
    @description = description
  end

  def name_with_description = [name, description].compact.join(' ')

  ANIMALS = [
    ['fly', nil, nil],
    ['spider', 'It wriggled and jiggled and tickled inside her.', 'that wriggled and jiggled and tickled inside her'],
    ['bird', 'How absurd to swallow a bird!', nil],
    ['cat', 'Imagine that, to swallow a cat!', nil],
    ['dog', 'What a hog, to swallow a dog!', nil],
    ['goat', 'Just opened her throat and swallowed a goat!', nil],
    ['cow', 'I don\'t know how she swallowed a cow!', nil],
    ['horse', nil, nil]
  ].freeze
  private_constant :ANIMALS
end