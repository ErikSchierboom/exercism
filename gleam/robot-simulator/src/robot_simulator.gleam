import gleam/string
import gleam/list

pub type Robot {
  Robot(direction: Direction, position: Position)
}

pub type Direction {
  North
  East
  South
  West
}

pub type Position {
  Position(x: Int, y: Int)
}

pub fn create(direction: Direction, position: Position) -> Robot {
  Robot(direction, position)
}

pub fn move(
  direction: Direction,
  position: Position,
  instructions: String,
) -> Robot {
  instructions
  |> string.to_graphemes()
  |> list.fold(
    from: create(direction, position),
    with: fn(robot, instruction) {
      case instruction {
        "L" -> move_left(robot)
        "R" -> move_right(robot)
        "A" -> advance(robot)
      }
    },
  )
}

fn move_left(robot: Robot) -> Robot {
  case robot.direction {
    North -> Robot(..robot, direction: West)
    East -> Robot(..robot, direction: North)
    South -> Robot(..robot, direction: East)
    West -> Robot(..robot, direction: South)
  }
}

fn move_right(robot: Robot) -> Robot {
  case robot.direction {
    North -> Robot(..robot, direction: East)
    East -> Robot(..robot, direction: South)
    South -> Robot(..robot, direction: West)
    West -> Robot(..robot, direction: North)
  }
}

fn advance(robot: Robot) -> Robot {
  case robot.direction, robot.position {
    North, Position(x, y) -> Robot(..robot, position: Position(x, y + 1))
    East, Position(x, y) -> Robot(..robot, position: Position(x + 1, y))
    South, Position(x, y) -> Robot(..robot, position: Position(x, y - 1))
    West, Position(x, y) -> Robot(..robot, position: Position(x - 1, y))
  }
}
