class Robot
  LETTERS = ('A'..'Z').to_a.freeze
  DIGITS = ('0'..'9').to_a.freeze
  private_constant :LETTERS, :DIGITS

  attr_reader :name

  def initialize
    reset
  end

  def reset
    @name = Robot.random_names.next.join
  end

  def self.forget
    @@robot_names = nil
  end

  def self.random_names
    @@robot_names ||= LETTERS.product(LETTERS, DIGITS, DIGITS, DIGITS).shuffle.to_enum
  end
end