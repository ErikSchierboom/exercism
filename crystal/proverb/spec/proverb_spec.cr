require "spec"
require "../src/*"

describe "Proverb" do
  it "zero pieces" do
    input = [] of String
    output = [] of String
    Proverb.recite(input).should eq(output)
  end

  it "one piece" do
    input = ["nail"]
    output = ["And all for the want of a nail."]
    Proverb.recite(input).should eq(output)
  end

  it "two pieces" do
    input = ["nail", "shoe"]
    output = ["For want of a nail the shoe was lost.", "And all for the want of a nail."]
    Proverb.recite(input).should eq(output)
  end

  it "three pieces" do
    input = ["nail", "shoe", "horse"]
    output = [
      "For want of a nail the shoe was lost.", "For want of a shoe the horse was lost.", "And all for the want of a nail.",
    ]
    Proverb.recite(input).should eq(output)
  end

  it "full proverb" do
    input = ["nail", "shoe", "horse", "rider", "message", "battle", "kingdom"]
    output = [
      "For want of a nail the shoe was lost.", "For want of a shoe the horse was lost.", "For want of a horse the rider was lost.",
      "For want of a rider the message was lost.", "For want of a message the battle was lost.",
      "For want of a battle the kingdom was lost.", "And all for the want of a nail.",
    ]
    Proverb.recite(input).should eq(output)
  end

  it "four pieces modernized" do
    input = ["pin", "gun", "soldier", "battle"]
    output = [
      "For want of a pin the gun was lost.", "For want of a gun the soldier was lost.", "For want of a soldier the battle was lost.",
      "And all for the want of a pin.",
    ]
    Proverb.recite(input).should eq(output)
  end
end
