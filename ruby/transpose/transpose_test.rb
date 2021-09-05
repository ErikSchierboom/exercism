require 'minitest/autorun'
require_relative 'transpose'

# Common test data version: 1.1.0 92bc877
class TransposeTest < Minitest::Test
  def test_empty_string
    # skip
    input = ""

    expected = ""

    assert_equal expected, Transpose.transpose(input)
  end

  def test_two_characters_in_a_row
    input = "A1"

    expected = "A\n1"

    assert_equal expected, Transpose.transpose(input)
  end

  def test_two_characters_in_a_column
    input = "A\n1"

    expected = "A1"

    assert_equal expected, Transpose.transpose(input)
  end

  def test_simple
    input = "ABC\n123"

    expected = "A1\nB2\nC3"

    assert_equal expected, Transpose.transpose(input)
  end

  def test_single_line
    input = "Single line."

    expected = "S\ni\nn\ng\nl\ne\n \nl\ni\nn\ne\n."

    assert_equal expected, Transpose.transpose(input)
  end

  def test_first_line_longer_than_second_line
    input = "The fourth line.\nThe fifth line."

    expected = "TT\nhh\nee\n  \nff\noi\nuf\nrt\nth\nh \n l\nli\nin\nne\ne.\n."

    assert_equal expected, Transpose.transpose(input)
  end

  def test_second_line_longer_than_first_line
    input = "The first line.\nThe second line."

    expected = "TT\nhh\nee\n  \nfs\nie\nrc\nso\ntn\n d\nl \nil\nni\nen\n.e\n ."

    assert_equal expected, Transpose.transpose(input)
  end

  def test_mixed_line_length
    input = "The longest line.\nA long line.\nA longer line.\nA line."

    expected = "TAAA\nh   \nelll\n ooi\nlnnn\nogge\nn e.\nglr\nei \nsnl\ntei\n .n\nl e\ni .\nn\ne\n."

    assert_equal expected, Transpose.transpose(input)
  end

  def test_square
    input = "HEART\nEMBER\nABUSE\nRESIN\nTREND"

    expected = "HEART\nEMBER\nABUSE\nRESIN\nTREND"

    assert_equal expected, Transpose.transpose(input)
  end

  def test_rectangle
    input = "FRACTURE\nOUTLINED\nBLOOMING\nSEPTETTE"

    expected = "FOBS\nRULE\nATOP\nCLOT\nTIME\nUNIT\nRENT\nEDGE"

    assert_equal expected, Transpose.transpose(input)
  end

  def test_triangle
    input = "T\nEE\nAAA\nSSSS\nEEEEE\nRRRRRR"

    expected = "TEASER\n EASER\n  ASER\n   SER\n    ER\n     R"

    assert_equal expected, Transpose.transpose(input)
  end
end
