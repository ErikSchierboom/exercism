import org.junit.Test
import org.junit.Ignore
import kotlin.test.assertEquals

class BobTest {

    @Test
    fun statingSomething() {
        assertEquals("Whatever.", Bob.hey("Tom-ay-to, tom-aaaah-to."))
    }

    @Test
    fun shouting() {
        assertEquals("Whoa, chill out!", Bob.hey("WATCH OUT!"))
    }

    @Test
    fun shoutingGibberish() {
        assertEquals("Whoa, chill out!", Bob.hey("FCECDFCAAB"))
    }

    @Test
    fun askingAQuestion() {
        assertEquals("Sure.", Bob.hey("Does this cryogenic chamber make me look fat?"))
    }

    @Test
    fun askingANumericQuestion() {
        assertEquals("Sure.", Bob.hey("You are, what, like 15?"))
    }

    @Test
    fun askingGibberish() {
        assertEquals("Sure.", Bob.hey("fffbbcbeab?"))
    }

    @Test
    fun talkingForcefully() {
        assertEquals("Whatever.", Bob.hey("Let's go make out behind the gym!"))
    }

    @Test
    fun usingAcronymsInRegularSpeech() {
        assertEquals("Whatever.", Bob.hey("It's OK if you don't want to go to the DMV."))
    }

    @Test
    fun forcefulQuestion() {
        assertEquals("Calm down, I know what I'm doing!", Bob.hey("WHAT THE HELL WERE YOU THINKING?"))
    }

    @Test
    fun shoutingNumbers() {
        assertEquals("Whoa, chill out!", Bob.hey("1, 2, 3 GO!"))
    }

    @Test
    fun noLetters() {
        assertEquals("Whatever.", Bob.hey("1, 2, 3"))
    }

    @Test
    fun questionWithNoLetters() {
        assertEquals("Sure.", Bob.hey("4?"))
    }

    @Test
    fun shoutingWithSpecialCharacters() {
        assertEquals("Whoa, chill out!", Bob.hey("ZOMG THE %^*@#$(*^ ZOMBIES ARE COMING!!11!!1!"))
    }

    @Test
    fun shoutingWithNoExclamationMark() {
        assertEquals("Whoa, chill out!", Bob.hey("I HATE THE DMV"))
    }

    @Test
    fun statementContainingQuestionMark() {
        assertEquals("Whatever.", Bob.hey("Ending with ? means a question."))
    }

    @Test
    fun nonLettersWithQuestion() {
        assertEquals("Sure.", Bob.hey(":) ?"))
    }

    @Test
    fun prattlingOn() {
        assertEquals("Sure.", Bob.hey("Wait! Hang on. Are you going to be OK?"))
    }

    @Test
    fun silence() {
        assertEquals("Fine. Be that way!", Bob.hey(""))
    }

    @Test
    fun prolongedSilence() {
        assertEquals("Fine. Be that way!", Bob.hey("          "))
    }

    @Test
    fun alternateSilence() {
        assertEquals("Fine. Be that way!", Bob.hey("\t\t\t\t\t\t\t\t\t\t"))
    }

    @Test
    fun multipleLineQuestion() {
        assertEquals("Whatever.", Bob.hey("\nDoes this cryogenic chamber make me look fat?\nno"))
    }

    @Test
    fun startingWithWhitespace() {
        assertEquals("Whatever.", Bob.hey("         hmmmmmmm..."))
    }

    @Test
    fun endingWithWhitespace() {
        assertEquals("Sure.", Bob.hey("Okay if like my  spacebar  quite a bit?   "))
    }

    @Test
    fun otherWhitespace() {
        assertEquals("Fine. Be that way!", Bob.hey("\n\r \t"))
    }

    @Test
    fun nonQuestionEndingWithWhitespace() {
        assertEquals("Whatever.", Bob.hey("This is a statement ending with whitespace      "))
    }

}
