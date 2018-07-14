import scala.collection.immutable.SortedMap

class School {
  var db = Map[Int, Seq[String]]().withDefaultValue(Nil)

  def add(name: String, grade: Int) = db = db + (grade -> (db(grade) :+ name))

  def sorted: Map[Int, Seq[String]] = SortedMap(db.toSeq:_*).mapValues(_.sorted)

  def grade(grade: Int): Seq[String] = db(grade)
}