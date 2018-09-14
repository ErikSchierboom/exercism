import java.util.Collections;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;

final class HandshakeCalculator {

    private final HashMap<Integer, Signal> CommandsMapping = new HashMap<Integer, Signal>();

    public HandshakeCalculator() {
        CommandsMapping.put(1 << 0, Signal.WINK);
        CommandsMapping.put(1 << 1, Signal.DOUBLE_BLINK);
        CommandsMapping.put(1 << 2, Signal.CLOSE_YOUR_EYES);
        CommandsMapping.put(1 << 3, Signal.JUMP);
    }

    public List<Signal> calculateHandshake(int i) {

        LinkedList<Signal> handshake = new LinkedList<>();

        CommandsMapping.forEach((key, value) -> {
            if (containsCommand(i, key))
                handshake.add(value);
        });

        int reverseCommand = 1 << 4;
        if (containsCommand(i, reverseCommand))
            Collections.reverse(handshake);

        return handshake;
    }

    private static boolean containsCommand(int number, int mask) {
        return (number & mask) != 0;
    }
}