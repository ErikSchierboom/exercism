import org.junit.Test
import org.junit.Ignore
import kotlin.test.assertEquals

class SpaceAgeTest {

    @Test
    fun ageOnEarth() {
        val age = SpaceAge(1000000000)

        assertEquals(31.69, age.onEarth())
    }

    @Test
    fun ageOnMercury() {
        val age = SpaceAge(2134835688)

        assertEquals(280.88, age.onMercury())
    }

    @Test
    fun ageOnVenus() {
        val age = SpaceAge(189839836)

        assertEquals(9.78, age.onVenus())
    }

    @Test
    fun ageOnMars() {
        val age = SpaceAge(2329871239L)

        assertEquals(39.25, age.onMars())
    }

    @Test
    fun ageOnJupiter() {
        val age = SpaceAge(901876382)

        assertEquals(2.41, age.onJupiter())
    }

    @Test
    fun ageOnSaturn() {
        val age = SpaceAge(3000000000L)

        assertEquals(3.23, age.onSaturn())
    }

    @Test
    fun ageOnUranus() {
        val age = SpaceAge(3210123456L)

        assertEquals(1.21, age.onUranus())
    }

    @Test
    fun ageOnNeptune() {
        val age = SpaceAge(8210123456L)

        assertEquals(1.58, age.onNeptune())
    }

}
