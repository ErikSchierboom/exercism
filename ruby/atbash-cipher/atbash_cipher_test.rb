require 'minitest/autorun'
require_relative 'atbash_cipher'

# Common test data version: 1.2.0 d5238bd
class AtbashCipherTest < Minitest::Test
  def test_encode_yes
    # skip
    plaintext = 'yes'
    ciphertext = 'bvh'
    assert_equal ciphertext, Atbash.encode(plaintext)
  end

  def test_encode_no
    plaintext = 'no'
    ciphertext = 'ml'
    assert_equal ciphertext, Atbash.encode(plaintext)
  end

  def test_encode_omg
    plaintext = 'OMG'
    ciphertext = 'lnt'
    assert_equal ciphertext, Atbash.encode(plaintext)
  end

  def test_encode_spaces
    plaintext = 'O M G'
    ciphertext = 'lnt'
    assert_equal ciphertext, Atbash.encode(plaintext)
  end

  def test_encode_mindblowingly
    plaintext = 'mindblowingly'
    ciphertext = 'nrmwy oldrm tob'
    assert_equal ciphertext, Atbash.encode(plaintext)
  end

  def test_encode_numbers
    plaintext = 'Testing,1 2 3, testing.'
    ciphertext = 'gvhgr mt123 gvhgr mt'
    assert_equal ciphertext, Atbash.encode(plaintext)
  end

  def test_encode_deep_thought
    plaintext = 'Truth is fiction.'
    ciphertext = 'gifgs rhurx grlm'
    assert_equal ciphertext, Atbash.encode(plaintext)
  end

  def test_encode_all_the_letters
    plaintext = 'The quick brown fox jumps over the lazy dog.'
    ciphertext = 'gsvjf rxpyi ldmul cqfnk hlevi gsvoz abwlt'
    assert_equal ciphertext, Atbash.encode(plaintext)
  end

  def test_decode_exercism
    ciphertext = 'vcvix rhn'
    plaintext = 'exercism'
    assert_equal plaintext, Atbash.decode(ciphertext)
  end

  def test_decode_a_sentence
    ciphertext = 'zmlyh gzxov rhlug vmzhg vkkrm thglm v'
    plaintext = 'anobstacleisoftenasteppingstone'
    assert_equal plaintext, Atbash.decode(ciphertext)
  end

  def test_decode_numbers
    ciphertext = 'gvhgr mt123 gvhgr mt'
    plaintext = 'testing123testing'
    assert_equal plaintext, Atbash.decode(ciphertext)
  end

  def test_decode_all_the_letters
    ciphertext = 'gsvjf rxpyi ldmul cqfnk hlevi gsvoz abwlt'
    plaintext = 'thequickbrownfoxjumpsoverthelazydog'
    assert_equal plaintext, Atbash.decode(ciphertext)
  end

  def test_decode_with_too_many_spaces
    ciphertext = 'vc vix    r hn'
    plaintext = 'exercism'
    assert_equal plaintext, Atbash.decode(ciphertext)
  end

  def test_decode_with_no_spaces
    ciphertext = 'zmlyhgzxovrhlugvmzhgvkkrmthglmv'
    plaintext = 'anobstacleisoftenasteppingstone'
    assert_equal plaintext, Atbash.decode(ciphertext)
  end
end
