class Robot
  BEARINGS = %i[east west north south].freeze
  private_constant :BEARINGS

  attr_accessor :coordinates, :bearing

  def initialize
    @coordinates = [0, 0]
    @bearing = :north
  end

  def orient(direction)
    raise ArgumentError, 'Invalid direction' unless BEARINGS.include?(direction)

    @bearing = direction
  end

  def at(x, y)
    @coordinates = [x, y]
  end

  def turn_right
    case @bearing
    when :north
      @bearing = :east
    when :east
      @bearing = :south
    when :south
      @bearing = :west
    when :west
      @bearing = :north
    end
  end

  def turn_left
    case @bearing
    when :north
      @bearing = :west
    when :east
      @bearing = :north
    when :south
      @bearing = :east
    when :west
      @bearing = :south
    end
  end

  def advance
    case @bearing
    when :north
      @coordinates[1] += 1
    when :east
      @coordinates[0] += 1
    when :south
      @coordinates[1] -= 1
    when :west
      @coordinates[0] -= 1
    end
  end
end

class Simulator
  LETTER_TO_INSTRUCTION = { 'A' => :advance, 'L' => :turn_left, 'R' => :turn_right }.freeze
  private_constant :LETTER_TO_INSTRUCTION

  def place(robot, x:, y:, direction:)
    robot.at(x, y)
    robot.orient(direction)
  end

  def evaluate(robot, word)
    instructions(word).each_with_object(robot) do |instruction, evaluatingRobot|
      evaluatingRobot.send(instruction)
    end
  end

  def instructions(word)
    word.each_char.map { |letter| LETTER_TO_INSTRUCTION[letter] }
  end
end