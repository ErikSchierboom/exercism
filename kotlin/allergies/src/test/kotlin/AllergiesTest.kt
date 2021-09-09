import org.junit.Test
import org.junit.Ignore
import kotlin.test.assertEquals
import kotlin.test.assertFalse
import kotlin.test.assertTrue

class AllergiesTest {
    @Test
    fun `eggs | not allergic to anything`() = assertIsNotAllergic(0, Allergen.EGGS)

    @Test
    fun `eggs | allergic only to eggs`() = assertIsAllergic(1, Allergen.EGGS)

    @Test
    fun `eggs | allergic to eggs and something else`() = assertIsAllergic(3, Allergen.EGGS)

    @Test
    fun `eggs | allergic to something, but not eggs`() = assertIsNotAllergic(2, Allergen.EGGS)

    @Test
    fun `eggs | allergic to everything`() = assertIsAllergic(255, Allergen.EGGS)

    @Test
    fun `peanuts | not allergic to anything`() = assertIsNotAllergic(0, Allergen.PEANUTS)

    @Test
    fun `peanuts | allergic only to peanuts`() = assertIsAllergic(2, Allergen.PEANUTS)

    @Test
    fun `peanuts | allergic to peanuts and something else`() = assertIsAllergic(7, Allergen.PEANUTS)

    @Test
    fun `peanuts | allergic to something, but not peanuts`() = assertIsNotAllergic(5, Allergen.PEANUTS)

    @Test
    fun `peanuts | allergic to everything`() = assertIsAllergic(255, Allergen.PEANUTS)

    @Test
    fun `shellfish | not allergic to anything`() = assertIsNotAllergic(0, Allergen.SHELLFISH)

    @Test
    fun `shellfish | allergic only to shellfish`() = assertIsAllergic(4, Allergen.SHELLFISH)

    @Test
    fun `shellfish | allergic to shellfish and something else`() = assertIsAllergic(14, Allergen.SHELLFISH)

    @Test
    fun `shellfish | allergic to something, but not shellfish`() = assertIsNotAllergic(10, Allergen.SHELLFISH)

    @Test
    fun `shellfish | allergic to everything`() = assertIsAllergic(255, Allergen.SHELLFISH)

    @Test
    fun `strawberries | not allergic to anything`() = assertIsNotAllergic(0, Allergen.STRAWBERRIES)

    @Test
    fun `strawberries | allergic only to strawberries`() = assertIsAllergic(8, Allergen.STRAWBERRIES)

    @Test
    fun `strawberries | allergic to strawberries and something else`() = assertIsAllergic(28, Allergen.STRAWBERRIES)

    @Test
    fun `strawberries | allergic to something, but not strawberries`() = assertIsNotAllergic(20, Allergen.STRAWBERRIES)

    @Test
    fun `strawberries | allergic to everything`() = assertIsAllergic(255, Allergen.STRAWBERRIES)

    @Test
    fun `tomatoes | not allergic to anything`() = assertIsNotAllergic(0, Allergen.TOMATOES)

    @Test
    fun `tomatoes | allergic only to tomatoes`() = assertIsAllergic(16, Allergen.TOMATOES)

    @Test
    fun `tomatoes | allergic to tomatoes and something else`() = assertIsAllergic(56, Allergen.TOMATOES)

    @Test
    fun `tomatoes | allergic to something, but not tomatoes`() = assertIsNotAllergic(40, Allergen.TOMATOES)

    @Test
    fun `tomatoes | allergic to everything`() = assertIsAllergic(255, Allergen.TOMATOES)

    @Test
    fun `chocolate | not allergic to anything`() = assertIsNotAllergic(0, Allergen.CHOCOLATE)

    @Test
    fun `chocolate | allergic only to chocolate`() = assertIsAllergic(32, Allergen.CHOCOLATE)

    @Test
    fun `chocolate | allergic to chocolate and something else`() = assertIsAllergic(112, Allergen.CHOCOLATE)

    @Test
    fun `chocolate | allergic to something, but not chocolate`() = assertIsNotAllergic(80, Allergen.CHOCOLATE)

    @Test
    fun `chocolate | allergic to everything`() = assertIsAllergic(255, Allergen.CHOCOLATE)

    @Test
    fun `pollen | not allergic to anything`() = assertIsNotAllergic(0, Allergen.POLLEN)

    @Test
    fun `pollen | allergic only to pollen`() = assertIsAllergic(64, Allergen.POLLEN)

    @Test
    fun `pollen | allergic to pollen and something else`() = assertIsAllergic(224, Allergen.POLLEN)

    @Test
    fun `pollen | allergic to something, but not pollen`() = assertIsNotAllergic(160, Allergen.POLLEN)

    @Test
    fun `pollen | allergic to everything`() = assertIsAllergic(255, Allergen.POLLEN)

    @Test
    fun `cats | not allergic to anything`() = assertIsNotAllergic(0, Allergen.CATS)

    @Test
    fun `cats | allergic only to cats`() = assertIsAllergic(128, Allergen.CATS)

    @Test
    fun `cats | allergic to cats and something else`() = assertIsAllergic(192, Allergen.CATS)

    @Test
    fun `cats | allergic to something, but not cats`() = assertIsNotAllergic(64, Allergen.CATS)

    @Test
    fun `cats | allergic to everything`() = assertIsAllergic(255, Allergen.CATS)

    @Test
    fun `list | no allergies`() = assertAllergens(0, emptyList())

    @Test
    fun `list | just eggs`() = assertAllergens(
            1,
            listOf(Allergen.EGGS))

    @Test
    fun `list | just peanuts`() = assertAllergens(
            2,
            listOf(Allergen.PEANUTS))

    @Test
    fun `list | eggs and peanuts`() = assertAllergens(
            3,
            listOf(Allergen.EGGS, Allergen.PEANUTS))

    @Test
    fun `list | more than eggs but not peanuts`() = assertAllergens(
            5,
            listOf(Allergen.EGGS, Allergen.SHELLFISH))

    @Test
    fun `list | lots of stuff`() = assertAllergens(
            248,
            listOf(Allergen.STRAWBERRIES, Allergen.TOMATOES, Allergen.CHOCOLATE, Allergen.POLLEN, Allergen.CATS))

    @Test
    fun `list | everything`() = assertAllergens(
            255,
            Allergen.values().toList())

    @Test
    fun `list | no allergen score parts`() = assertAllergens(
            509,
            Allergen.values().toList() - Allergen.PEANUTS)
}

private fun assertIsAllergic(score: Int, allergen: Allergen) = assertTrue(Allergies(score).isAllergicTo(allergen))

private fun assertIsNotAllergic(score: Int, allergen: Allergen) = assertFalse(Allergies(score).isAllergicTo(allergen))

private fun assertAllergens(score: Int, allergens: List<Allergen>) = assertEquals(allergens, Allergies(score).getList())
