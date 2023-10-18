require "spec"
require "../src/*"

describe "SimpleCipher" do
  describe "Random key cipher" do
    it "Can encode" do
      cipher = SimpleCipher.new
      cipher.encode("aaaaaaaaaa").should eq(cipher.key[0, "aaaaaaaaaa".size])
    end

    it "Can decode" do
      cipher = SimpleCipher.new
      cipher.decode(cipher.key[0, "aaaaaaaaaa".size]).should eq("aaaaaaaaaa")
    end

    it "Is reversible. I.e., if you apply decode in a encoded result, you must see the same plaintext encode parameter as a result of the decode method" do
      cipher = SimpleCipher.new
      cipher.decode(cipher.encode("abcdefghij")).should eq("abcdefghij")
    end

    it "Key is made only of lowercase letters" do
      cipher = SimpleCipher.new
      /^[a-z]+$/.matches?(cipher.key).should be_true
    end
  end

  describe "Substitution cipher" do
    it "Can encode" do
      cipher = SimpleCipher.new("abcdefghij")
      cipher.encode("aaaaaaaaaa").should eq("abcdefghij")
    end

    it "Can decode" do
      cipher = SimpleCipher.new("abcdefghij")
      cipher.decode("abcdefghij").should eq("aaaaaaaaaa")
    end

    it "Is reversible. I.e., if you apply decode in a encoded result, you must see the same plaintext encode parameter as a result of the decode method" do
      cipher = SimpleCipher.new("abcdefghij")
      cipher.decode(cipher.encode("abcdefghij")).should eq("abcdefghij")
    end

    it "Can double shift encode" do
      cipher = SimpleCipher.new("iamapandabear")
      cipher.encode("iamapandabear").should eq("qayaeaagaciai")
    end

    it "Can wrap on encode" do
      cipher = SimpleCipher.new("abcdefghij")
      cipher.encode("zzzzzzzzzz").should eq("zabcdefghi")
    end

    it "Can wrap on decode" do
      cipher = SimpleCipher.new("abcdefghij")
      cipher.decode("zabcdefghi").should eq("zzzzzzzzzz")
    end

    it "Can encode messages longer than the key" do
      cipher = SimpleCipher.new("abc")
      cipher.encode("iamapandabear").should eq("iboaqcnecbfcr")
    end

    it "Can decode messages longer than the key" do
      cipher = SimpleCipher.new("abc")
      cipher.decode("iboaqcnecbfcr").should eq("iamapandabear")
    end
  end
end
