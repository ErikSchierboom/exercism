import org.junit.Ignore
import org.junit.Test
import kotlin.test.assertEquals

class ListExtensionsTest {

    @Test
    fun testAppendingEmptyLists() {
        assertEquals(
                emptyList(),
                emptyList<Int>().customAppend(emptyList()))
    }

    @Test
    fun testAppendingNonEmptyListOnEmptyList() {
        assertEquals(
                listOf('1', '2', '3', '4'),
                emptyList<Char>().customAppend(listOf('1', '2', '3', '4')))
    }

    @Test
    fun testAppendingNonEmptyListOnNonEmptyList() {
        assertEquals(
                listOf("1", "2", "2", "3", "4", "5"),
                listOf("1", "2").customAppend(listOf("2", "3", "4", "5")))
    }

    @Test
    fun testConcatOnEmptyListOfLists() {
        assertEquals(
                emptyList(),
                emptyList<List<Int>>().customConcat())
    }

    @Test
    fun testConcatOnNonEmptyListOfLists() {
        assertEquals(
                listOf('1', '2', '3', '4', '5', '6'),
                listOf(listOf('1', '2'), listOf('3'), emptyList(), listOf('4', '5', '6')).customConcat())
    }

    @Test
    fun testFilteringEmptyList() {
        assertEquals(
                emptyList(),
                emptyList<Int>().customFilter { it % 2 == 1 })
    }

    @Test
    fun testFilteringNonEmptyList() {
        assertEquals(
                listOf(1, 3, 5),
                listOf(1, 2, 3, 5).customFilter { it % 2 == 1 })
    }

    @Test
    fun testSizeOfEmptyList() {
        assertEquals(0, emptyList<Int>().customSize)
    }

    @Test
    fun testSizeOfNonEmptyList() {
        assertEquals(4, listOf("one", "two", "three", "four").customSize)
    }

    @Test
    fun testTransformingEmptyList() {
        assertEquals(
                emptyList(),
                emptyList<Int>().customMap { it -> it + 1 })
    }

    @Test
    fun testTransformingNonEmptyList() {
        assertEquals(
                listOf(2, 4, 6, 8),
                listOf(1, 3, 5, 7).customMap { it -> it + 1 })
    }

    @Test
    fun testFoldLeftOnEmptyList() {
        assertEquals(
                2.0,
                emptyList<Int>().customFoldLeft(2.0, Double::times))
    }

    @Test
    fun testFoldLeftWithDirectionIndependentOperationOnNonEmptyList() {
        assertEquals(
                15,
                listOf(1, 2, 3, 4).customFoldLeft(5, Int::plus))
    }

    @Test
    fun testFoldLeftWithDirectionDependentOperationOnNonEmptyList() {
        assertEquals(
                0,
                listOf(2, 5).customFoldLeft(5, Int::div))
    }

    @Test
    fun testFoldRightOnEmptyList() {
        assertEquals(
                2.0,
                emptyList<Double>().customFoldRight(2.0, Double::times))
    }

    @Test
    fun testFoldRightWithDirectionIndependentOperationOnNonEmptyList() {
        assertEquals(
                15,
                listOf(1, 2, 3, 4).customFoldRight(5, Int::plus))
    }

    @Test
    fun testFoldRightWithDirectionDependentOperationOnNonEmptyList() {
        assertEquals(
                2,
                listOf(2, 5).customFoldRight(5, Int::div))
    }

    @Test
    fun testReversingEmptyList() {
        assertEquals(
                emptyList(),
                emptyList<Int>().customReverse())
    }

    @Test
    fun testReversingNonEmptyList() {
        assertEquals(
                listOf('7', '5', '3', '1'),
                listOf('1', '3', '5', '7').customReverse())
    }

}
