import org.junit.Test;
import org.junit.Ignore;
import org.junit.Before;

import static org.junit.Assert.*;

public class BobTest {
    private Bob bob;


    @Before
    public void setUp() {
        bob = new Bob();
    }

    @Test
    public void saySomething() {
        assertEquals(
            "Whatever.",
            bob.hey("Tom-ay-to, tom-aaaah-to.")
        );
    }

    @Test
    public void shouting() {
        assertEquals(
            "Whoa, chill out!",
            bob.hey("WATCH OUT!")
        );
    }

    @Test
    public void shoutingGibberish() {
        assertEquals(
            "Whoa, chill out!",
            bob.hey("FCECDFCAAB")
        );
    }

    @Test
    public void askingAQuestion() {
        assertEquals(
            "Sure.",
            bob.hey("Does this cryogenic chamber make me look fat?")
        );
    }

    @Test
    public void askingANumericQuestion() {
        assertEquals(
            "Sure.",
            bob.hey("You are, what, like 15?")
        );
    }

    @Test
    public void askingGibberish() {
        assertEquals(
            "Sure.",
            bob.hey("fffbbcbeab?")
        );
    }

    @Test
    public void talkingForcefully() {
        assertEquals(
            "Whatever.",
            bob.hey("Hi there!")
        );
    }

    @Test
    public void usingAcronymsInRegularSpeech() {
        assertEquals(
            "Whatever.", bob.hey("It's OK if you don't want to go work for NASA.")
        );
    }

    @Test
    public void forcefulQuestions() {
        assertEquals(
            "Calm down, I know what I'm doing!", bob.hey("WHAT'S GOING ON?")
        );
    }

    @Test
    public void shoutingNumbers() {
        assertEquals(
            "Whoa, chill out!", bob.hey("1, 2, 3 GO!")
        );
    }

    @Test
    public void onlyNumbers() {
        assertEquals(
            "Whatever.", bob.hey("1, 2, 3")
        );
    }

    @Test
    public void questionWithOnlyNumbers() {
        assertEquals(
            "Sure.", bob.hey("4?")
        );
    }

    @Test
    public void shoutingWithSpecialCharacters() {
        assertEquals(
            "Whoa, chill out!", bob.hey("ZOMG THE %^*@#$(*^ ZOMBIES ARE COMING!!11!!1!")
        );
    }

    @Test
    public void shoutingWithNoExclamationMark() {
        assertEquals(
            "Whoa, chill out!", bob.hey("I HATE THE DENTIST")
        );
    }

    @Test
    public void statementContainingQuestionMark() {
        assertEquals(
            "Whatever.", bob.hey("Ending with ? means a question.")
        );
    }

    @Test
    public void nonLettersWithQuestion() {
        assertEquals(
            "Sure.", bob.hey(":) ?")
        );
    }

    @Test
    public void prattlingOn() {
        assertEquals(
            "Sure.", bob.hey("Wait! Hang on. Are you going to be OK?")
        );
    }

    @Test
    public void silence() {
        assertEquals(
            "Fine. Be that way!", bob.hey("")
        );
    }

    @Test
    public void prolongedSilence() {
        assertEquals(
            "Fine. Be that way!", bob.hey("          ")
        );
    }

    @Test
    public void alternateSilence() {
        assertEquals(
            "Fine. Be that way!", bob.hey("\t\t\t\t\t\t\t\t\t\t")
        );
    }

    @Test
    public void multipleLineQuestion() {
        assertEquals(
            "Whatever.",
            bob.hey("\nDoes this cryogenic chamber make me look fat?\nNo.")
        );
    }

    @Test
    public void startingWithWhitespace() {
        assertEquals(
            "Whatever.",
            bob.hey("         hmmmmmmm...")
        );
    }

    @Test
    public void endingWithWhiteSpace() {
        assertEquals(
            "Sure.",
            bob.hey("Okay if like my  spacebar  quite a bit?   ")
        );
    }

    @Test
    public void otherWhiteSpace() {
        assertEquals(
            "Fine. Be that way!",
            bob.hey("\n\r \t")
        );
    }

    @Test
    public void nonQuestionEndingWithWhiteSpace() {
        assertEquals(
            "Whatever.",
            bob.hey("This is a statement ending with whitespace      ")
        );
    }

}
