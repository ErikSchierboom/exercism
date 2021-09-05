import org.junit.Ignore
import org.junit.Test
import kotlin.test.assertFalse
import kotlin.test.assertTrue

class TriangleTest {

    @Test
    fun `equilateral | all sides are equal`() {
        assertTrue(Triangle(2, 2, 2).isEquilateral)
    }

    @Test
    fun `equilateral | any side is unequal`() {
        assertFalse(Triangle(2, 3, 2).isEquilateral)
    }

    @Test
    fun `equilateral | no sides are equal`() {
        assertFalse(Triangle(5, 4, 6).isEquilateral)
    }

    @Test(expected = IllegalArgumentException::class)
    fun `equilateral | all zero sides is not a triangle`() {
        assertFalse(Triangle(0, 0, 0).isEquilateral)
    }

    @Test
    fun `equilateral | sides may be floats`() {
        assertTrue(Triangle(0.5, 0.5, 0.5).isEquilateral)
    }

    @Test
    fun `isosceles | last two sides are equal`() {
        assertTrue(Triangle(3, 4, 4).isIsosceles)
    }

    @Test
    fun `isosceles | first two sides are equal`() {
        assertTrue(Triangle(4, 4, 3).isIsosceles)
    }

    @Test
    fun `isosceles | first and last sides are equal`() {
        assertTrue(Triangle(4, 3, 4).isIsosceles)
    }

    @Test
    fun `isosceles | equilateral triangles are also isosceles`() {
        assertTrue(Triangle(4, 4, 4).isIsosceles)
    }

    @Test
    fun `isosceles | no sides are equal`() {
        assertFalse(Triangle(2, 3, 4).isIsosceles)
    }

    @Test(expected = IllegalArgumentException::class)
    fun `triangle inequality violation | last is greater then sum of others `() {
        Triangle(1, 1, 3)
    }

    @Test(expected = IllegalArgumentException::class)
    fun `triangle inequality violation | second is greater then sum of others `() {
        Triangle(1, 3, 1)
    }

    @Test(expected = IllegalArgumentException::class)
    fun `triangle inequality violation | first is greater then sum of others `() {
        Triangle(3, 1, 1)
    }

    @Test
    fun `isosceles | sides may be floats`() {
        assertTrue(Triangle(0.5, 0.4, 0.5).isIsosceles)
    }

    @Test
    fun `scalene | no sides are equal`() {
        assertTrue(Triangle(5, 4, 6).isScalene)
    }

    @Test
    fun `scalene | all sides are equal`() {
        assertFalse(Triangle(4, 4, 4).isScalene)
    }

    @Test
    fun `scalene | two sides are equal`() {
        assertFalse(Triangle(4, 4, 3).isScalene)
    }

    @Test(expected = IllegalArgumentException::class)
    fun `scalene | may not violate triangle inequality`() {
        Triangle(7, 3, 2)
    }

    @Test
    fun `scalene | sides may be floats`() {
        assertTrue(Triangle(0.5, 0.4, 0.6).isScalene)
    }

}
