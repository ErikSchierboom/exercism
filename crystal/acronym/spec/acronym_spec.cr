require "spec"
require "../src/*"

describe "Acronym" do
  it "does basic" do
    Acronym.abbreviate("Portable Network Graphics").should eq("PNG")
  end

  it "does lowercase words" do
    Acronym.abbreviate("Ruby on Rails").should eq("ROR")
  end

  it "does punctuation" do
    Acronym.abbreviate("First In, First Out").should eq("FIFO")
  end

  it "does all caps word" do
    Acronym.abbreviate("GNU Image Manipulation Program").should eq("GIMP")
  end

  it "does punctuation without whitespace" do
    Acronym.abbreviate("Complementary metal-oxide semiconductor").should eq("CMOS")
  end

  it "does very long abbreviation" do
    Acronym.abbreviate("Rolling On The Floor Laughing So Hard That My Dogs Came Over And Licked Me").should eq("ROTFLSHTMDCOALM")
  end

  it "does consecutive delimiters" do
    Acronym.abbreviate("Something - I made up from thin air").should eq("SIMUFTA")
  end

  it "does apostrophes" do
    Acronym.abbreviate("Halley's Comet").should eq("HC")
  end

  it "does underscore emphasis" do
    Acronym.abbreviate("The Road _Not_ Taken").should eq("TRNT")
  end
end
