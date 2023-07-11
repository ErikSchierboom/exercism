import org.scalatest.{Matchers, FunSuite}

/** @version 1.2.0 */
class AllergiesTest extends FunSuite with Matchers {

  test("Allergen.Peanuts - no allergies means not allergic") {
    Allergies.allergicTo(Allergen.Peanuts, 0) should be(false)
  }

  test("Allergen.Cats - no allergies means not allergic") {
    Allergies.allergicTo(Allergen.Cats, 0) should be(false)
  }

  test("Allergen.Strawberries - no allergies means not allergic") {
    Allergies.allergicTo(Allergen.Strawberries, 0) should be(false)
  }

  test("Allergen.Eggs - is allergic to eggs") {
    Allergies.allergicTo(Allergen.Eggs, 1) should be(true)
  }

  test("Allergen.Eggs - allergic to eggs in addition to other stuff") {
    Allergies.allergicTo(Allergen.Eggs, 5) should be(true)
  }

  test("Allergen.Shellfish - allergic to eggs in addition to other stuff") {
    Allergies.allergicTo(Allergen.Shellfish, 5) should be(true)
  }

  test("Allergen.Strawberries - allergic to eggs in addition to other stuff") {
    Allergies.allergicTo(Allergen.Strawberries, 5) should be(false)
  }

  test("Allergen.Eggs - allergic to strawberries but not peanuts") {
    Allergies.allergicTo(Allergen.Eggs, 9) should be(true)
  }

  test("Allergen.Peanuts - allergic to strawberries but not peanuts") {
    Allergies.allergicTo(Allergen.Peanuts, 9) should be(false)
  }

  test("Allergen.Shellfish - allergic to strawberries but not peanuts") {
    Allergies.allergicTo(Allergen.Shellfish, 9) should be(false)
  }

  test("Allergen.Strawberries - allergic to strawberries but not peanuts") {
    Allergies.allergicTo(Allergen.Strawberries, 9) should be(true)
  }

  test("no allergies at all") {
    Allergies.list(0) should be(List())
  }

  test("allergic to just eggs") {
    Allergies.list(1) should be(List(Allergen.Eggs))
  }

  test("allergic to just peanuts") {
    Allergies.list(2) should be(List(Allergen.Peanuts))
  }

  test("allergic to just strawberries") {
    Allergies.list(8) should be(List(Allergen.Strawberries))
  }

  test("allergic to eggs and peanuts") {
    Allergies.list(3) should be(List(Allergen.Eggs, Allergen.Peanuts))
  }

  test("allergic to more than eggs but not peanuts") {
    Allergies.list(5) should be(List(Allergen.Eggs, Allergen.Shellfish))
  }

  test("allergic to lots of stuff") {
    Allergies.list(248) should be(
      List(Allergen.Strawberries,
           Allergen.Tomatoes,
           Allergen.Chocolate,
           Allergen.Pollen,
           Allergen.Cats))
  }

  test("allergic to everything") {
    Allergies.list(255) should be(
      List(Allergen.Eggs,
           Allergen.Peanuts,
           Allergen.Shellfish,
           Allergen.Strawberries,
           Allergen.Tomatoes,
           Allergen.Chocolate,
           Allergen.Pollen,
           Allergen.Cats))
  }

  test("ignore non allergen score parts") {
    Allergies.list(509) should be(
      List(Allergen.Eggs,
           Allergen.Shellfish,
           Allergen.Strawberries,
           Allergen.Tomatoes,
           Allergen.Chocolate,
           Allergen.Pollen,
           Allergen.Cats))
  }
}
