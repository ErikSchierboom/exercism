module FoodChain
  def self.song = 1.upto(Animal::ANIMALS.size).map(&Verse.method(:lyrics)).join($/)
end

class Verse
  def self.lyrics(number) = self.for(number).lyrics

  def self.for(number)
    case number
    when 1
      FirstVerse
    when Animal::ANIMALS.size
      LastVerse
    else
      self
    end.new(number)
  end

  attr_reader :number

  def initialize(number) = @number = number

  def lyrics = [fact, embellishment, history, conclusion].compact.join($/) + $/
  def fact = "I know an old lady who swallowed a #{animal}."
  def conclusion = "I don't know why she swallowed the fly. Perhaps she'll die."
  def embellishment = animal.embellishment

  def swallowed(animal, caught)
    "She swallowed the #{animal} to catch the #{caught.name_with_description}."
  end

  def history =
    number
      .downto(1)
      .each_cons(2)
      .map {|swallowed_idx, caught_idx| swallowed(Animal.for(swallowed_idx), Animal.for(caught_idx))}
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
  def self.for(number) = ANIMALS[number - 1]

  attr_reader :name, :embellishment, :description

  def initialize(name, embellishment, description)
    @name = name
    @embellishment = embellishment
    @description = description
  end

  def to_s = name

  def name_with_description = [name, description].compact.join(' ')

  ANIMALS = [
    new('fly', nil, nil).freeze,
    new('spider', 'It wriggled and jiggled and tickled inside her.', 'that wriggled and jiggled and tickled inside her').freeze,
    new('bird', 'How absurd to swallow a bird!', nil).freeze,
    new('cat', 'Imagine that, to swallow a cat!', nil).freeze,
    new('dog', 'What a hog, to swallow a dog!', nil).freeze,
    new('goat', 'Just opened her throat and swallowed a goat!', nil).freeze,
    new('cow', 'I don\'t know how she swallowed a cow!', nil).freeze,
    new('horse', nil, nil).freeze
  ].freeze
end