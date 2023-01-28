class Robot
  attr_reader :name

  def initialize = reset
  def reset = @name = Robot.random_names.next
  
  def self.forget = random_names.rewind
  def self.random_names = @@robot_names ||= ('AA000'..'ZZ999').to_a.shuffle.to_enum
end