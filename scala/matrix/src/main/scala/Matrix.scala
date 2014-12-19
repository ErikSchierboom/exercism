class Matrix(val input: String) {
  lazy val rowValues = input.split("\n").map(s => s.split(" ").map(_.toInt)).toVector

  def rows(row: Int) = rowValues(row)
  def cols(col: Int) = rowValues.map(r => r(col))

  override def equals(obj:Any) = obj.isInstanceOf[Matrix] && obj.asInstanceOf[Matrix].input == this.input
}

object Matrix {
  def apply(input: String) = new Matrix(input)
}