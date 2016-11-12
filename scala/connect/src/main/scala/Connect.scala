object Color extends Enumeration {
  type Color = Value
  val White, Black = Value
}

case class Connect(lines: List[String]) {
  type Coordinate = (Int, Int)

  def charToColor(c: Char) =
    c match {
      case 'O' => Some(Color.White)
      case 'X' => Some(Color.Black)
      case  _  => None
    }

  val cols = lines.head.length
  val rows = lines.length

  val board = (0 until rows).map(row => (0 until cols).map(col => charToColor(lines(row)(col))))

  def coordinateColor(coordinate: Coordinate) = coordinate match { case (col, row) => board(row)(col) }

  def isValidCoordinate(coordinate: Coordinate) = coordinate match {
    case (col, row) => row >= 0 && row < rows && col >= 0 && col < cols
  }

  def hasColor(color: Color.Value, coordinate: Coordinate) = coordinateColor(coordinate).contains(color)

  def adjacent(color: Color.Value, coordinate: Coordinate) = {
    def isValid(c: Coordinate) = isValidCoordinate(c) && hasColor(color, c)

    coordinate match {
      case (col, row) => List(
        (col + 1, row - 1), (col    , row - 1),
        (col - 1, row    ), (col + 1, row    ),
        (col - 1, row + 1), (col    , row + 1)
      ).filter(isValid)
    }
  }

  def validPath(color: Color.Value, stop: ((Int, Int)) => Boolean, processed: Set[(Int, Int)], coord: (Int, Int)): Boolean = {
    if (stop(coord)) true
    else {
      val next = adjacent(color, coord)
      val notVisited = next.toSet -- processed

      if (notVisited.isEmpty) false
      else notVisited.exists(next => validPath(color, stop, processed +  coord, next))
    }
  }

  def isWhiteStop(coordinate: Coordinate) = coordinate match { case (_, row) => row == rows - 1 }
  def isBlackStop(coordinate: Coordinate) = coordinate match { case (col, _) => col == cols - 1 }

  lazy val whiteStart = for {
    col <- (0 until cols).toSet
    if hasColor(Color.White, (col, 0))
  } yield (col, 0)

  lazy val blackStart = for {
    row <- (0 until rows).toSet
    if hasColor(Color.Black, (0, row))
  } yield (0, row)

  def colorWins(color: Color.Value, stop: ((Int, Int)) => Boolean, start: Set[Coordinate])  =
    start.exists(validPath(color, stop, Set.empty, _))

  lazy val whiteWins = colorWins(Color.White, isWhiteStop, whiteStart)
  lazy val blackWins = colorWins(Color.Black, isBlackStop, blackStart)

  val result =
    if (whiteWins) Some(Color.White)
    else if (blackWins) Some(Color.Black)
    else None
}
