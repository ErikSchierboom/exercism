module FoodChain
  def self.song = Animal::ANIMALS.map(&Verse.method(:for)).join($/)
end

class Verse
  def self.for(animal)
    case animal
    when Animal::ANIMALS.first
      FirstVerse
    when Animal::ANIMALS.last
      LastVerse
    else
      self
    end.new(animal)
  end

  attr_reader :animal

  def initialize(animal) = @animal = animal

  def to_s = [fact, embellishment, history, conclusion].compact.join($/) + $/
  def fact = "I know an old lady who swallowed a #{animal}."
  def conclusion = "I don't know why she swallowed the fly. Perhaps she'll die."
  def embellishment = animal.embellishment

  def history =
    Animal::ANIMALS[0..Animal::ANIMALS.index(animal)]
      .reverse
      .each_cons(2)
      .map {|swallowed, caught| "She swallowed the #{swallowed} to catch the #{caught}#{caught.description}."}
      .join($/)
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
  attr_reader :name, :embellishment, :description

  def initialize(name, embellishment = nil, description: nil)
    @name = name
    @embellishment = embellishment
    @description = description
    freeze
  end

  def to_s = name

  ANIMALS = [
    new('fly'),
    new('spider', 'It wriggled and jiggled and tickled inside her.', description: ' that wriggled and jiggled and tickled inside her'),
    new('bird', 'How absurd to swallow a bird!'),
    new('cat', 'Imagine that, to swallow a cat!'),
    new('dog', 'What a hog, to swallow a dog!'),
    new('goat', 'Just opened her throat and swallowed a goat!'),
    new('cow', 'I don\'t know how she swallowed a cow!'),
    new('horse')
  ].freeze
end
