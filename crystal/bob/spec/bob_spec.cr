require "spec"
require "../src/*"

describe "Bob" do
  describe "#hey" do
    it "responds to stating something" do
      Bob.hey("Tom-ay-to, tom-aaaah-to.").should eq "Whatever."
    end

    it "responds to shouting something" do
      Bob.hey("WATCH OUT!").should eq "Whoa, chill out!"
    end

    it "responds to asking a question" do
      Bob.hey("Does this cryogenic chamber make me look fat?").should eq "Sure."
    end

    it "responds to talking forcefully" do
      Bob.hey("Let's go make out behind the gym!").should eq "Whatever."
    end

    it "responds to using acronyms in regular speech" do
      Bob.hey("It's OK if you don't want to go to the DMV.").should eq "Whatever."
    end

    it "responds to forceful questions" do
      Bob.hey("WHAT THE HELL WERE YOU THINKING?").should eq "Calm down, I know what I'm doing!"
    end

    it "responds to shouting numbers" do
      Bob.hey("1, 2, 3 GO!").should eq "Whoa, chill out!"
    end

    it "responds to only numbers" do
      Bob.hey("1, 2, 3").should eq "Whatever."
    end

    it "responds to question with only numbers" do
      Bob.hey("4?").should eq "Sure."
    end

    it "responds to shouting with special characters" do
      Bob.hey("ZOMG THE %^*@#$(*^ ZOMBIES ARE COMING!!11!!1!").should eq "Whoa, chill out!"
    end

    it "responds to shouting with no exclamation mark" do
      Bob.hey("I HATE YOU").should eq "Whoa, chill out!"
    end

    it "responds to statement containing question mark" do
      Bob.hey("Ending with a ? means a question.").should eq "Whatever."
    end

    it "responds to prattling on" do
      Bob.hey("Wait! Hang on.  Are you going to be OK?").should eq "Sure."
    end

    it "responds to silence" do
      Bob.hey("").should eq "Fine. Be that way!"
    end

    it "responds to prolonged silence" do
      Bob.hey("   ").should eq "Fine. Be that way!"
    end
  end
end
