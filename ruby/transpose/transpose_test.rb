require 'minitest/autorun'
require_relative 'transpose'

# Common test data version: 1.1.0 92bc877
class TransposeTest < Minitest::Test
  def test_empty_string
    input = <<-INPUT.gsub(/^ {6}/, '').strip

    INPUT

    expected = <<-EXPECTED.gsub(/^ {6}/, '').strip

    EXPECTED

    assert_equal expected, Transpose.transpose(input)
  end

  def test_two_characters_in_a_row
    input = <<-INPUT.gsub(/^ {6}/, '').strip
      A1
    INPUT

    expected = <<-EXPECTED.gsub(/^ {6}/, '').strip
      A
      1
    EXPECTED

    assert_equal expected, Transpose.transpose(input)
  end

  def test_two_characters_in_a_column
    input = <<-INPUT.gsub(/^ {6}/, '').strip
      A
      1
    INPUT

    expected = <<-EXPECTED.gsub(/^ {6}/, '').strip
      A1
    EXPECTED

    assert_equal expected, Transpose.transpose(input)
  end

  def test_simple
    input = <<-INPUT.gsub(/^ {6}/, '').strip
      ABC
      123
    INPUT

    expected = <<-EXPECTED.gsub(/^ {6}/, '').strip
      A1
      B2
      C3
    EXPECTED

    assert_equal expected, Transpose.transpose(input)
  end

  def test_single_line
    input = <<-INPUT.gsub(/^ {6}/, '').strip
      Single line.
    INPUT

    expected = <<-EXPECTED.gsub(/^ {6}/, '').strip
      S
      i
      n
      g
      l
      e
       
      l
      i
      n
      e
      .
    EXPECTED

    assert_equal expected, Transpose.transpose(input)
  end

  def test_first_line_longer_than_second_line
    input = <<-INPUT.gsub(/^ {6}/, '').strip
      The fourth line.
      The fifth line.
    INPUT

    expected = <<-EXPECTED.gsub(/^ {6}/, '').strip
      TT
      hh
      ee
        
      ff
      oi
      uf
      rt
      th
      h 
       l
      li
      in
      ne
      e.
      .
    EXPECTED

    assert_equal expected, Transpose.transpose(input)
  end

  def test_second_line_longer_than_first_line
    input = <<-INPUT.gsub(/^ {6}/, '').strip
      The first line.
      The second line.
    INPUT

    expected = <<-EXPECTED.gsub(/^ {6}/, '').strip
      TT
      hh
      ee
        
      fs
      ie
      rc
      so
      tn
       d
      l 
      il
      ni
      en
      .e
       .
    EXPECTED

    assert_equal expected, Transpose.transpose(input)
  end

  def test_mixed_line_length
    input = <<-INPUT.gsub(/^ {6}/, '').strip
      The longest line.
      A long line.
      A longer line.
      A line.
    INPUT

    expected = <<-EXPECTED.gsub(/^ {6}/, '').strip
      TAAA
      h   
      elll
       ooi
      lnnn
      ogge
      n e.
      glr
      ei 
      snl
      tei
       .n
      l e
      i .
      n
      e
      .
    EXPECTED

    assert_equal expected, Transpose.transpose(input)
  end

  def test_square
    input = <<-INPUT.gsub(/^ {6}/, '').strip
      HEART
      EMBER
      ABUSE
      RESIN
      TREND
    INPUT

    expected = <<-EXPECTED.gsub(/^ {6}/, '').strip
      HEART
      EMBER
      ABUSE
      RESIN
      TREND
    EXPECTED

    assert_equal expected, Transpose.transpose(input)
  end

  def test_rectangle
    input = <<-INPUT.gsub(/^ {6}/, '').strip
      FRACTURE
      OUTLINED
      BLOOMING
      SEPTETTE
    INPUT

    expected = <<-EXPECTED.gsub(/^ {6}/, '').strip
      FOBS
      RULE
      ATOP
      CLOT
      TIME
      UNIT
      RENT
      EDGE
    EXPECTED

    assert_equal expected, Transpose.transpose(input)
  end

  def test_triangle
    input = <<-INPUT.gsub(/^ {6}/, '').strip
      T
      EE
      AAA
      SSSS
      EEEEE
      RRRRRR
    INPUT

    expected = <<-EXPECTED.gsub(/^ {6}/, '').strip
      TEASER
       EASER
        ASER
         SER
          ER
           R
    EXPECTED

    assert_equal expected, Transpose.transpose(input)
  end
end
