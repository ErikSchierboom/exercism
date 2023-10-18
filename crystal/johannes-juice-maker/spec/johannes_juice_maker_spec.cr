require "spec"
require "../src/*"

describe "JuiceMaker" do
  describe "debug_light_on?" do
    it "should be on if the machine is running" do
      JuiceMaker.debug_light_on?.should be_true
    end
  end

  describe "initialize" do
    it "should create a new JuiceMaker" do
      {% if JuiceMaker.has_method? "initialize" %}
        juice_maker = JuiceMaker.new(0)
        juice_maker.@fluid.should eq 0
        juice_maker.@running.should be_false
      {% else %}
        raise "Error: wrong number of arguments for 'JuiceMaker.new' (given 1, expected 0)"
      {% end %}
    end

    it "Can take a fluid as input" do
      {% if JuiceMaker.has_method? "initialize" %}
        juice_maker = JuiceMaker.new(5)
        juice_maker.@fluid.should eq 5
        juice_maker.@running.should be_false
      {% else %}
        raise "Error: wrong number of arguments for 'JuiceMaker.new' (given 1, expected 0)"
      {% end %}
    end
  end

  describe "start" do
    it "Can start the machine" do
      {% if JuiceMaker.has_method?("initialize") && JuiceMaker.has_method?("start") %}
        juice_maker = JuiceMaker.new(50)
        juice_maker.start
        juice_maker.@running.should be_true
      {% else %}
        raise "Error: undefined method 'start' for JuiceMaker"
      {% end %}
    end

    it "Can start the machine even if there is no fluid" do
      {% if JuiceMaker.has_method?("start") && JuiceMaker.has_method?("initialize") %}
        juice_maker = JuiceMaker.new(0)
        juice_maker.start
        juice_maker.@running.should be_true
      {% else %}
        raise "Error: undefined method 'start' for JuiceMaker"
      {% end %}
    end
  end

  describe "running?" do
    it "Status should return true if the machine is started" do
      {% if JuiceMaker.has_method?("start") && JuiceMaker.has_method?("initialize") && JuiceMaker.has_method?("running?") %}
        juice_maker = JuiceMaker.new(50)
        juice_maker.start
        juice_maker.running?.should be_true
      {% else %}
        raise "Error: undefined method 'running?' for JuiceMaker"
      {% end %}
    end

    it "Status return false if the machine is not started" do
      {% if JuiceMaker.has_method?("start") && JuiceMaker.has_method?("initialize") && JuiceMaker.has_method?("running?") %}
        juice_maker = JuiceMaker.new(0)
        juice_maker.running?.should be_false
      {% else %}
        raise "Error: undefined method 'running?' for JuiceMaker"
      {% end %}
    end
  end

  describe "add_fluid" do
    it "Can add fluid to the machine" do
      {% if JuiceMaker.has_method?("add_fluid") && JuiceMaker.has_method?("initialize") %}
        juice_maker = JuiceMaker.new(0)
        juice_maker.add_fluid(5)
        juice_maker.@fluid.should eq 5
      {% else %}
        raise "Error: undefined method 'add_fluid' for JuiceMaker"
      {% end %}
    end
    it "Can add fluid multiple times" do
      {% if JuiceMaker.has_method?("add_fluid") && JuiceMaker.has_method?("initialize") %}
        juice_maker = JuiceMaker.new(5)
        juice_maker.add_fluid(5)
        juice_maker.add_fluid(20)
        juice_maker.add_fluid(1)
        juice_maker.@fluid.should eq 31
      {% else %}
        raise "Error: undefined method 'add_fluid' for JuiceMaker"
      {% end %}
    end
  end

  describe "stop" do
    it "Can stop the machine" do
      {% if JuiceMaker.has_method?("add_fluid") && JuiceMaker.has_method?("initialize") && JuiceMaker.has_method?("start") && JuiceMaker.has_method?("running?") && JuiceMaker.has_method?("stop") %}
        juice_maker = JuiceMaker.new(50)
        juice_maker.start
        juice_maker.running?.should be_true
        juice_maker.stop(5)
        juice_maker.running?.should be_false
        juice_maker.@fluid.should eq 25
      {% else %}
        raise "Error: undefined method 'stop' for JuiceMaker"
      {% end %}
    end

    it "Doesn't remove any fluid if the machine stops right after start" do
      {% if JuiceMaker.has_method?("add_fluid") && JuiceMaker.has_method?("initialize") && JuiceMaker.has_method?("start") && JuiceMaker.has_method?("running?") && JuiceMaker.has_method?("stop") %}
        juice_maker = JuiceMaker.new(50)
        juice_maker.start
        juice_maker.running?.should be_true
        juice_maker.stop(0)
        juice_maker.running?.should be_false
        juice_maker.@fluid.should eq 50
      {% else %}
        raise "Error: undefined method 'stop' for JuiceMaker"
      {% end %}
    end
  end
end
