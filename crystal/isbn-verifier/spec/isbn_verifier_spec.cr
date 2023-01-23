require "spec"
require "../src/*"

describe "IsbnVerifier" do
  it "valid isbn" do
    IsbnVerifier.valid?("3-598-21508-8").should eq(true)
  end

  it "invalid isbn check digit" do
    IsbnVerifier.valid?("3-598-21508-9").should eq(false)
  end

  it "valid isbn with a check digit of 10" do
    IsbnVerifier.valid?("3-598-21507-X").should eq(true)
  end

  it "check digit is a character other than X" do
    IsbnVerifier.valid?("3-598-21507-A").should eq(false)
  end

  it "invalid check digit in isbn is not treated as zero" do
    IsbnVerifier.valid?("4-598-21507-B").should eq(false)
  end

  it "invalid character in isbn is not treated as zero" do
    IsbnVerifier.valid?("3-598-P1581-X").should eq(false)
  end

  it "X is only valid as a check digit" do
    IsbnVerifier.valid?("3-598-2X507-9").should eq(false)
  end

  it "valid isbn without separating dashes" do
    IsbnVerifier.valid?("3598215088").should eq(true)
  end

  it "isbn without separating dashes and X as check digit" do
    IsbnVerifier.valid?("359821507X").should eq(true)
  end

  it "isbn without check digit and dashes" do
    IsbnVerifier.valid?("359821507").should eq(false)
  end

  it "too long isbn and no dashes" do
    IsbnVerifier.valid?("3598215078X").should eq(false)
  end

  it "too short isbn" do
    IsbnVerifier.valid?("00").should eq(false)
  end

  it "isbn without check digit" do
    IsbnVerifier.valid?("3-598-21507").should eq(false)
  end

  it "check digit of X should not be used for 0" do
    IsbnVerifier.valid?("3-598-21515-X").should eq(false)
  end

  it "empty isbn" do
    IsbnVerifier.valid?("").should eq(false)
  end

  it "input is 9 characters" do
    IsbnVerifier.valid?("134456729").should eq(false)
  end

  it "invalid characters are not ignored after checking length" do
    IsbnVerifier.valid?("3132P34035").should eq(false)
  end

  it "invalid characters are not ignored before checking length" do
    IsbnVerifier.valid?("3598P215088").should eq(false)
  end

  it "input is too long but contains a valid isbn" do
    IsbnVerifier.valid?("98245726788").should eq(false)
  end
end
