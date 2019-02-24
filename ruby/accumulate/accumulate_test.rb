require 'minitest/autorun'
require_relative 'accumulate'

class ArrayTest < Minitest::Test
  def test_empty_accumulation
    assert_equal [], [].accumulate { |e| e * e }
  end

  def test_accumulate_squares
    result = [1, 2, 3].accumulate do |number|
      number * number
    end
    assert_equal [1, 4, 9], result
  end

  def test_accumulate_upcases
    result = %w(hello world).accumulate(&:upcase)
    assert_equal %w(HELLO WORLD), result
  end

  def test_accumulate_reversed_strings
    result = %w(the quick brown fox etc).accumulate(&:reverse)
    assert_equal %w(eht kciuq nworb xof cte), result
  end

  def test_accumulate_recursively
    result = %w(a b c).accumulate do |char|
      %w(1 2 3).accumulate do |digit|
        "#{char}#{digit}"
      end
    end
    assert_equal [%w(a1 a2 a3), %w(b1 b2 b3), %w(c1 c2 c3)], result
  end

  def test_do_not_change_in_place
    original = [1, 2, 3]
    copy = original.dup
    original.accumulate { |n| n * n }
    assert_equal copy, original
  end

  def test_accumulate_when_block_is_deferred
    accumulate_enumerator = [1, 2, 3].accumulate
    accumulated_result = accumulate_enumerator.map do |number|
      number * number
    end
    assert_equal [1, 4, 9], accumulated_result
  end
end
