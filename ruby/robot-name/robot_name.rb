class Robot
  attr_reader :name

  def initialize
    reset
  end

  def reset
    @name = Robot.random_names.pop
  end

  def self.forget
    @@robot_names = nil
  end

  def self.random_names
    @@robot_names ||= [*'AA000'..'ZZ999'].shuffle
  end
end