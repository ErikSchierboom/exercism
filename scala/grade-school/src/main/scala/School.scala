import scala.collection.immutable.SortedMap

class School {
  var database = Map[Int, Seq[String]]().withDefaultValue(Nil)
  var sortedDatabase = SortedMap[Int, Seq[String]]().withDefaultValue(Nil)

  def add(newStudent: String, newGrade: Int) = {
    database = database.updated(newGrade, database(newGrade) :+ newStudent)
    sortedDatabase = sortedDatabase.updated(newGrade, (sortedDatabase(newGrade) :+ newStudent).sorted)
  }

  def db: Map[Int, Seq[String]] = database
  def sorted: Map[Int, Seq[String]] = sortedDatabase

  def grade(grade: Int): Seq[String] = db(grade)
}