require 'minitest/autorun'
require_relative 'strain'

class ArrayTest < Minitest::Test
  def test_empty_keep
    assert_equal [], ([].keep { |e| e < 10 })
  end

  def test_keep_everything
    assert_equal [1, 2, 3], ([1, 2, 3].keep { |e| e < 10 })
  end

  def test_keep_first_and_last
    assert_equal [1, 3], [1, 2, 3].keep(&:odd?)
  end

  def test_keep_neither_first_nor_last
    assert_equal [2, 4], [1, 2, 3, 4, 5].keep(&:even?)
  end

  def test_keep_strings
    words = %w[apple zebra banana zombies cherimoya zelot]
    result = words.keep { |word| word.start_with?('z') }
    assert_equal %w[zebra zombies zelot], result
  end

  def test_keep_arrays
    rows = [
      [1, 2, 3],
      [5, 5, 5],
      [5, 1, 2],
      [2, 1, 2],
      [1, 5, 2],
      [2, 2, 1],
      [1, 2, 5]
    ]
    result = rows.keep { |row| row.include?(5) }
    assert_equal [[5, 5, 5], [5, 1, 2], [1, 5, 2], [1, 2, 5]], result
  end

  def test_empty_discard
    assert_equal [], ([].discard { |e| e < 10 })
  end

  def test_discard_nothing
    assert_equal [1, 2, 3], ([1, 2, 3].discard { |e| e > 10 })
  end

  def test_discard_first_and_last
    assert_equal [2], [1, 2, 3].discard(&:odd?)
  end

  def test_discard_neither_first_nor_last
    assert_equal [1, 3, 5], [1, 2, 3, 4, 5].discard(&:even?)
  end

  def test_discard_strings
    words = %w[apple zebra banana zombies cherimoya zelot]
    result = words.discard { |word| word.start_with?('z') }
    assert_equal %w[apple banana cherimoya], result
  end

  def test_discard_arrays
    rows = [
      [1, 2, 3],
      [5, 5, 5],
      [5, 1, 2],
      [2, 1, 2],
      [1, 5, 2],
      [2, 2, 1],
      [1, 2, 5]
    ]
    result = rows.discard { |row| row.include?(5) }
    assert_equal [[1, 2, 3], [2, 1, 2], [2, 2, 1]], result
  end
end
