require 'minitest/autorun'
require_relative 'bracket_push'

# Common test data version: 1.5.0 20dd164
class BracketPushTest < Minitest::Test
  def test_paired_square_brackets
    assert Brackets.paired?('[]')
  end

  def test_empty_string
    assert Brackets.paired?('')
  end

  def test_unpaired_brackets
    refute Brackets.paired?('[[')
  end

  def test_wrong_ordered_brackets
    refute Brackets.paired?('}{')
  end

  def test_wrong_closing_bracket
    refute Brackets.paired?('{]')
  end

  def test_paired_with_whitespace
    assert Brackets.paired?('{ }')
  end

  def test_partially_paired_brackets
    refute Brackets.paired?('{[])')
  end

  def test_simple_nested_brackets
    assert Brackets.paired?('{[]}')
  end

  def test_several_paired_brackets
    assert Brackets.paired?('{}[]')
  end

  def test_paired_and_nested_brackets
    assert Brackets.paired?('([{}({}[])])')
  end

  def test_unopened_closing_brackets
    refute Brackets.paired?('{[)][]}')
  end

  def test_unpaired_and_nested_brackets
    refute Brackets.paired?('([{])')
  end

  def test_paired_and_wrong_nested_brackets
    refute Brackets.paired?('[({]})')
  end

  def test_paired_and_incomplete_brackets
    refute Brackets.paired?('{}[')
  end

  def test_too_many_closing_brackets
    refute Brackets.paired?('[]]')
  end

  def test_math_expression
    assert Brackets.paired?('(((185 + 223.85) * 15) - 543)/2')
  end

  def test_complex_latex_expression
    string = '\left(\begin{array}{cc} \frac{1}{3} & x\\ ' +
             '\mathrm{e}^{x} &... x^2 \end{array}\right)'
    assert Brackets.paired?(string)
  end
end
