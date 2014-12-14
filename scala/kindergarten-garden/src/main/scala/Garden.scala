class Garden(kids: List[String], plants: String) {

  lazy val sortedKids = kids.sorted

  val kidsToPlantsMap = {
    val plantRows = plants.split("\n").map(_.map(Plant.apply).grouped(2))
    val plantsForKids = plantRows(0).zip(plantRows(1)).map(r => r._1.toList ++ r._2.toList).toList

    sortedKids.zip(plantsForKids)
        .toMap
        .withDefaultValue(Nil)
  }

  def getPlants(kid: String) = kidsToPlantsMap(kid)
}

object Garden {
  private val defaultKids = List("Alice", "Bob", "Charlie", "David", "Eve", "Fred", "Ginny", "Harriet", "Ileana", "Joseph", "Kincaid", "Larry")

  def apply(kids: List[String], plants: String) = new Garden(kids, plants)
  def defaultGarden(plants: String) = new Garden(defaultKids, plants)
}

object Plant extends Enumeration {
  val Radishes = Value('R'.toInt, "Radishes")
  val Clover = Value('C'.toInt, "Clover")
  val Grass = Value('G'.toInt, "Grass")
  val Violets = Value('V'.toInt, "Violets")

  def apply(c: Char): Value = Plant.apply(c.toInt)
}
