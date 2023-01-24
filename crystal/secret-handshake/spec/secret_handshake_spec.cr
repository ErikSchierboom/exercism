require "spec"
require "../src/*"

describe "SecretHandshake" do
  it "wink for 1" do
    SecretHandshake.commands(1).should eq(["wink"] of String)
  end

  it "double blink for 10" do
    SecretHandshake.commands(2).should eq(["double blink"] of String)
  end

  it "close your eyes for 100" do
    SecretHandshake.commands(4).should eq(["close your eyes"] of String)
  end

  it "jump for 1000" do
    SecretHandshake.commands(8).should eq(["jump"] of String)
  end

  it "combine two actions" do
    SecretHandshake.commands(3).should eq(["wink", "double blink"] of String)
  end

  it "reverse two actions" do
    SecretHandshake.commands(19).should eq(["double blink", "wink"] of String)
  end

  it "reversing one action gives the same action" do
    SecretHandshake.commands(24).should eq(["jump"] of String)
  end

  it "reversing no actions still gives no actions" do
    SecretHandshake.commands(16).should eq([] of String)
  end

  it "all possible actions" do
    SecretHandshake.commands(15).should eq(["wink", "double blink", "close your eyes", "jump"] of String)
  end

  it "reverse all possible actions" do
    SecretHandshake.commands(31).should eq(["jump", "close your eyes", "double blink", "wink"] of String)
  end

  it "do nothing for zero" do
    SecretHandshake.commands(0).should eq([] of String)
  end
end
