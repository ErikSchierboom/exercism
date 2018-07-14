case class Position(x: Int, y: Int)

class Queens {
  def boardString(whiteQueen: Option[Position], blackQueen: Option[Position]) = {

    def positionCharacter(position: Position) = Some(position) match {
      case `whiteQueen` => 'W'
      case `blackQueen` => 'B'
      case _ => '_'
    }

    (0 until 8).map(x => (0 until 8).map(y => positionCharacter(new Position(x, y))).mkString(" ") + "\n").mkString
  }

  def canAttack(whiteQueen: Position, blackQueen: Position) = {
    def canAttackHorizontally = whiteQueen.x == blackQueen.x
    def canAttackVertically = whiteQueen.y == blackQueen.y
    def canAttackDiagonally = Math.abs(whiteQueen.x - blackQueen.x) == Math.abs(whiteQueen.y - blackQueen.y)

    canAttackHorizontally || canAttackVertically || canAttackDiagonally
  }

}

object Queens {
  def apply() = new Queens
}
