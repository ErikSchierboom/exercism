class Robot
  attr_accessor :coordinates, :bearing

  def initialize
    @coordinates = [0, 0]
    @bearing = :north
  end

  def orient(direction)
    raise ArgumentError, 'Invalid direction' unless BEARINGS.include?(direction)

    @bearing = direction
  end

  def at(x, y) = @coordinates = [x, y]

  def turn_right
    case @bearing
    when :north then @bearing = :east
    when :east  then @bearing = :south
    when :south then @bearing = :west
    when :west  then @bearing = :north
    end
  end

  def turn_left
    case @bearing
    when :north then @bearing = :west
    when :east  then @bearing = :north
    when :south then @bearing = :east
    when :west  then @bearing = :south
    end
  end

  def advance
    case @bearing
    when :north then @coordinates[1] += 1
    when :east  then @coordinates[0] += 1
    when :south then @coordinates[1] -= 1
    when :west  then @coordinates[0] -= 1
    end
  end

  BEARINGS = %i[east west north south].freeze
  private_constant :BEARINGS
end

class Simulator
  def place(robot, x:, y:, direction:)
    robot.at(x, y)
    robot.orient(direction)
  end

  def evaluate(robot, word)
    instructions(word).each_with_object(robot) do |instruction, evaluating_robot|
      evaluating_robot.send(instruction)
    end
  end

  def instructions(word) = word.each_char.map { |letter| LETTER_TO_INSTRUCTION[letter] }

  LETTER_TO_INSTRUCTION = { 'A' => :advance, 'L' => :turn_left, 'R' => :turn_right }.freeze
  private_constant :LETTER_TO_INSTRUCTION
end