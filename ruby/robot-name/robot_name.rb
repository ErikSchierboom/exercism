class Robot
  attr_reader :name

  def initialize
    reset
  end

  def reset
    @name = Robot.random_names.next
  end

  def self.forget
    random_names.rewind
  end

  def self.random_names
    @@robot_names ||= ('AA000'..'ZZ999').to_a.shuffle.to_enum
  end
end