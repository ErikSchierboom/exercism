require 'minitest/autorun'
require_relative 'isogram'

# Common test data version: 1.7.0 74869e8
class IsogramTest < Minitest::Test
  def test_empty_string
    input = ""
    assert Isogram.isogram?(input), "Expected true, '#{input}' is an isogram"
  end

  def test_isogram_with_only_lower_case_characters
    input = "isogram"
    assert Isogram.isogram?(input), "Expected true, '#{input}' is an isogram"
  end

  def test_word_with_one_duplicated_character
    input = "eleven"
    refute Isogram.isogram?(input), "Expected false, '#{input}' is not an isogram"
  end

  def test_word_with_one_duplicated_character_from_the_end_of_the_alphabet
    input = "zzyzx"
    refute Isogram.isogram?(input), "Expected false, '#{input}' is not an isogram"
  end

  def test_longest_reported_english_isogram
    input = "subdermatoglyphic"
    assert Isogram.isogram?(input), "Expected true, '#{input}' is an isogram"
  end

  def test_word_with_duplicated_character_in_mixed_case
    input = "Alphabet"
    refute Isogram.isogram?(input), "Expected false, '#{input}' is not an isogram"
  end

  def test_word_with_duplicated_character_in_mixed_case_lowercase_first
    input = "alphAbet"
    refute Isogram.isogram?(input), "Expected false, '#{input}' is not an isogram"
  end

  def test_hypothetical_isogrammic_word_with_hyphen
    input = "thumbscrew-japingly"
    assert Isogram.isogram?(input), "Expected true, '#{input}' is an isogram"
  end

  def test_hypothetical_word_with_duplicated_character_following_hyphen
    input = "thumbscrew-jappingly"
    refute Isogram.isogram?(input), "Expected false, '#{input}' is not an isogram"
  end

  def test_isogram_with_duplicated_hyphen
    input = "six-year-old"
    assert Isogram.isogram?(input), "Expected true, '#{input}' is an isogram"
  end

  def test_made_up_name_that_is_an_isogram
    input = "Emily Jung Schwartzkopf"
    assert Isogram.isogram?(input), "Expected true, '#{input}' is an isogram"
  end

  def test_duplicated_character_in_the_middle
    input = "accentor"
    refute Isogram.isogram?(input), "Expected false, '#{input}' is not an isogram"
  end

  def test_same_first_and_last_characters
    input = "angola"
    refute Isogram.isogram?(input), "Expected false, '#{input}' is not an isogram"
  end
end
