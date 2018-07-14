import org.junit.Ignore;
import org.junit.Test;

import static java.util.Arrays.asList;
import static java.util.Collections.emptyList;
import static java.util.Collections.singletonList;
import static org.junit.Assert.assertEquals;

public final class HandshakeCalculatorTest {

    @Test
    public void testThatInput1YieldsAWink() {
        assertEquals(
                singletonList(Signal.WINK),
                new HandshakeCalculator().calculateHandshake(1));
    }

    @Test
    public void testThatInput2YieldsADoubleBlink() {
        assertEquals(
                singletonList(Signal.DOUBLE_BLINK),
                new HandshakeCalculator().calculateHandshake(2));
    }

    @Test
    public void testThatInput4YieldsACloseYourEyes() {
        assertEquals(
                singletonList(Signal.CLOSE_YOUR_EYES),
                new HandshakeCalculator().calculateHandshake(4));
    }

    @Test
    public void testThatInput8YieldsAJump() {
        assertEquals(
                singletonList(Signal.JUMP),
                new HandshakeCalculator().calculateHandshake(8));
    }

    @Test
    public void testAnInputThatYieldsTwoActions() {
        assertEquals(
                asList(Signal.WINK, Signal.DOUBLE_BLINK),
                new HandshakeCalculator().calculateHandshake(3));
    }

    @Test
    public void testAnInputThatYieldsTwoReversedActions() {
        assertEquals(
                asList(Signal.DOUBLE_BLINK, Signal.WINK),
                new HandshakeCalculator().calculateHandshake(19));
    }

    @Test
    public void testReversingASingleActionYieldsTheSameAction() {
        assertEquals(
                singletonList(Signal.JUMP),
                new HandshakeCalculator().calculateHandshake(24));
    }

    @Test
    public void testReversingNoActionsYieldsNoActions() {
        assertEquals(
                emptyList(),
                new HandshakeCalculator().calculateHandshake(16));
    }

    @Test
    public void testInputThatYieldsAllActions() {
        assertEquals(
                asList(Signal.WINK, Signal.DOUBLE_BLINK, Signal.CLOSE_YOUR_EYES, Signal.JUMP),
                new HandshakeCalculator().calculateHandshake(15));
    }

    @Test
    public void testInputThatYieldsAllActionsReversed() {
        assertEquals(
                asList(Signal.JUMP, Signal.CLOSE_YOUR_EYES, Signal.DOUBLE_BLINK, Signal.WINK),
                new HandshakeCalculator().calculateHandshake(31));
    }

    @Test
    public void testThatInput0YieldsNoActions() {
        assertEquals(
                emptyList(),
                new HandshakeCalculator().calculateHandshake(0));
    }

    @Test
    public void testThatInputWithLower5BitsNotSetYieldsNoActions() {
        assertEquals(
                emptyList(),
                new HandshakeCalculator().calculateHandshake(32));
    }

}
