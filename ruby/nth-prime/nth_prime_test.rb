require 'minitest/autorun'
require_relative 'nth_prime'

class NthPrimeTest < Minitest::Test
  def test_first_prime
    assert_equal 2, Prime.nth(1)
  end

  def test_second_prime
    assert_equal 3, Prime.nth(2)
  end

  def test_sixth_prime
    assert_equal 13, Prime.nth(6)
  end

  def test_big_prime
    assert_equal 104_743, Prime.nth(10_001)
  end

  def test_there_is_no_zeroth_prime
    assert_raises(ArgumentError) do
      Prime.nth(0)
    end
  end
end
