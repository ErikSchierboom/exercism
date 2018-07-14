import Allergen.Allergen

class Allergies {
  private lazy val allergens = Allergen.values.toList

  def isAllergicTo(allergen: Allergen, score: Int) = (allergen.id & score) != 0
  def allergies(score: Int) = allergens.filter(isAllergicTo(_, score))
}

object Allergies {
  def apply() = new Allergies
}

object Allergen extends Enumeration {
  type Allergen = Value
  val Eggs = Value(1 << 0)
  val Peanuts = Value(1 << 1)
  val Shellfish = Value(1 << 2)
  val Strawberries = Value(1 << 3)
  val Tomatoes = Value(1 << 4)
  val Chocolate = Value(1 << 5)
  val Pollen = Value(1 << 6)
  val Cats = Value(1 << 7)
}