import Bearing.Bearing

case class Robot(bearing: Bearing, coordinates: (Int, Int)) {
  val (x, y) = coordinates

  def advance = bearing match {
    case Bearing.North => Robot(bearing, (x,     y + 1))
    case Bearing.East  => Robot(bearing, (x + 1, y))
    case Bearing.South => Robot(bearing, (x,     y - 1))
    case Bearing.West  => Robot(bearing, (x - 1, y))
  }

  def turnRight = bearing match {
    case Bearing.North => Robot(Bearing.East,  coordinates)
    case Bearing.East  => Robot(Bearing.South, coordinates)
    case Bearing.South => Robot(Bearing.West,  coordinates)
    case Bearing.West  => Robot(Bearing.North, coordinates)
  }

  def turnLeft = bearing match {
    case Bearing.North => Robot(Bearing.West,  coordinates)
    case Bearing.East  => Robot(Bearing.North, coordinates)
    case Bearing.South => Robot(Bearing.East,  coordinates)
    case Bearing.West  => Robot(Bearing.South, coordinates)
  }

  def simulate(instructions: String) = {
    instructions.foldLeft(this) {
      case (robot, instruction) => instruction match {
        case 'A' => robot.advance
        case 'L' => robot.turnLeft
        case 'R' => robot.turnRight
        case x => sys.error("Invalid instruction: " + x)
      }
    }
  }
}

object Bearing extends Enumeration {
  type Bearing = Value
  val North, East, South, West = Value
}