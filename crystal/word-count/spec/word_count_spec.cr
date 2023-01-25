require "spec"
require "../src/*"

describe "WordCount" do
  it "count one word" do
    sentence = "word"
    expected = {"word" => 1}
    WordCount.count_words(sentence).should eq(expected)
  end

  it "count one of each word" do
    sentence = "one of each"
    expected = {"one" => 1, "of" => 1, "each" => 1}
    WordCount.count_words(sentence).should eq(expected)
  end

  it "multiple occurrences of a word" do
    sentence = "one fish two fish red fish blue fish"
    expected = {"one" => 1, "fish" => 4, "two" => 1, "red" => 1, "blue" => 1}
    WordCount.count_words(sentence).should eq(expected)
  end

  it "handles cramped lists" do
    sentence = "one,two,three"
    expected = {"one" => 1, "two" => 1, "three" => 1}
    WordCount.count_words(sentence).should eq(expected)
  end

  it "handles expanded lists" do
    sentence = "one,\ntwo,\nthree"
    expected = {"one" => 1, "two" => 1, "three" => 1}
    WordCount.count_words(sentence).should eq(expected)
  end

  it "ignore punctuation" do
    sentence = "car: carpet as java: javascript!!&@$%^&"
    expected = {"car" => 1, "carpet" => 1, "as" => 1, "java" => 1, "javascript" => 1}
    WordCount.count_words(sentence).should eq(expected)
  end

  it "include numbers" do
    sentence = "testing, 1, 2 testing"
    expected = {"testing" => 2, "1" => 1, "2" => 1}
    WordCount.count_words(sentence).should eq(expected)
  end

  it "normalize case" do
    sentence = "go Go GO Stop stop"
    expected = {"go" => 3, "stop" => 2}
    WordCount.count_words(sentence).should eq(expected)
  end

  it "with apostrophes" do
    sentence = "'First: don't laugh. Then: don't cry. You're getting it.'"
    expected = {
      "first" => 1, "don't" => 2, "laugh" => 1, "then" => 1, "cry" => 1, "you're" => 1, "getting" => 1,
      "it" => 1,
    }
    WordCount.count_words(sentence).should eq(expected)
  end

  it "with quotations" do
    sentence = "Joe can't tell between 'large' and large."
    expected = {"joe" => 1, "can't" => 1, "tell" => 1, "between" => 1, "large" => 2, "and" => 1}
    WordCount.count_words(sentence).should eq(expected)
  end

  it "substrings from the beginning" do
    sentence = "Joe can't tell between app, apple and a."
    expected = {
      "joe" => 1, "can't" => 1, "tell" => 1, "between" => 1, "app" => 1, "apple" => 1, "and" => 1,
      "a" => 1,
    }
    WordCount.count_words(sentence).should eq(expected)
  end

  it "multiple spaces not detected as a word" do
    sentence = " multiple   whitespaces"
    expected = {"multiple" => 1, "whitespaces" => 1}
    WordCount.count_words(sentence).should eq(expected)
  end

  it "alternating word separators not detected as a word" do
    sentence = ",\n,one,\n ,two \n 'three'"
    expected = {"one" => 1, "two" => 1, "three" => 1}
    WordCount.count_words(sentence).should eq(expected)
  end

  it "quotation for word with apostrophe" do
    sentence = "can, can't, 'can't'"
    expected = {"can" => 1, "can't" => 2}
    WordCount.count_words(sentence).should eq(expected)
  end
end
