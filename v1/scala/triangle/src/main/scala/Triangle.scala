case class Triangle(x: Int, y: Int, z: Int) {
  def equalSides = Set(x, y, z).size

  def isValid = List(x, y, z).sorted match {
    case x :: y :: z :: Nil => x + y > z
  }

  def triangleType =
    if (isValid)
      equalSides match {
        case 2 => TriangleType.Isosceles
        case 1 => TriangleType.Equilateral
        case _ => TriangleType.Scalene
      }
    else TriangleType.Illogical
}

object TriangleType extends Enumeration {
  type TriangleType = Value
  val Equilateral, Isosceles, Scalene, Illogical = Value
}