require "spec"
require "../src/*"

describe "Anagram" do
  it "no matches" do
    Anagram.find("diaper", ["hello", "world", "zombies", "pants"]).should eq [] of String
  end

  it "detects two anagrams" do
    Anagram.find("master", ["stream", "pigeon", "maters"]).should eq ["stream", "maters"]
  end

  it "does not detect anagram subsets" do
    Anagram.find("good", ["dog", "goody"]).should eq [] of String
  end

  it "detects anagram" do
    Anagram.find("listen", ["enlists", "google", "inlets", "banana"]).should eq ["inlets"]
  end

  it "detects three anagrams" do
    Anagram.find("allergy", ["gallery", "ballerina", "regally", "clergy", "largely", "leading"]).should eq ["gallery", "regally", "largely"]
  end

  it "does not detect non-anagrams with identical checksum" do
    Anagram.find("mass", ["last"]).should eq [] of String
  end

  it "detects anagrams case-insensitively" do
    Anagram.find("Orchestra", ["cashregister", "Carthorse", "radishes"]).should eq ["Carthorse"]
  end

  it "detects anagrams using case-insensitive subject" do
    Anagram.find("Orchestra", ["cashregister", "carthorse", "radishes"]).should eq ["carthorse"]
  end

  it "detects anagrams using case-insensitive possible matches" do
    Anagram.find("orchestra", ["cashregister", "Carthorse", "radishes"]).should eq ["Carthorse"]
  end

  it "does not detect an anagram if the original word is repeated" do
    Anagram.find("go", ["go Go GO"]).should eq [] of String
  end

  it "anagrams must use all letters exactly once" do
    Anagram.find("tapper", ["patter"]).should eq [] of String
  end

  it "words are not anagrams of themselves (case-insensitive)" do
    Anagram.find("BANANA", ["BANANA", "Banana", "banana"]).should eq [] of String
  end
end
