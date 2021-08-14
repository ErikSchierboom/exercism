require 'minitest/autorun'
require_relative 'dominoes'

# Common test data version: 2.1.0 b5bc74d
class DominoesTest < Minitest::Test
  def test_empty_input_empty_output
    dominoes = []
    assert Dominoes.chain?(dominoes)
  end

  def test_singleton_input_singleton_output
    dominoes = [[1, 1]]
    assert Dominoes.chain?(dominoes)
  end

  def test_singleton_that_can_not_be_chained
    dominoes = [[1, 2]]
    refute Dominoes.chain?(dominoes)
  end

  def test_three_elements
    dominoes = [[1, 2], [3, 1], [2, 3]]
    assert Dominoes.chain?(dominoes)
  end

  def test_can_reverse_dominoes
    dominoes = [[1, 2], [1, 3], [2, 3]]
    assert Dominoes.chain?(dominoes)
  end

  def test_can_not_be_chained
    dominoes = [[1, 2], [4, 1], [2, 3]]
    refute Dominoes.chain?(dominoes)
  end

  def test_disconnected_simple
    dominoes = [[1, 1], [2, 2]]
    refute Dominoes.chain?(dominoes)
  end

  def test_disconnected_double_loop
    dominoes = [[1, 2], [2, 1], [3, 4], [4, 3]]
    refute Dominoes.chain?(dominoes)
  end

  def test_disconnected_single_isolated
    dominoes = [[1, 2], [2, 3], [3, 1], [4, 4]]
    refute Dominoes.chain?(dominoes)
  end

  def test_need_backtrack
    dominoes = [[1, 2], [2, 3], [3, 1], [2, 4], [2, 4]]
    assert Dominoes.chain?(dominoes)
  end

  def test_separate_loops
    dominoes = [[1, 2], [2, 3], [3, 1], [1, 1], [2, 2], [3, 3]]
    assert Dominoes.chain?(dominoes)
  end

  def test_nine_elements
    dominoes = [[1, 2], [5, 3], [3, 1], [1, 2], [2, 4], [1, 6], [2, 3], [3, 4], [5, 6]]
    assert Dominoes.chain?(dominoes)
  end
end
