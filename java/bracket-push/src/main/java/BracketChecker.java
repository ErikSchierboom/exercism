import java.util.Stack;

final class BracketPair {
    private final char open;
    private final char close;

    BracketPair(char open, char close) {
        this.open = open;
        this.close = close;
    }

    public char getOpen() {
        return open;
    }

    public char getClose() {
        return close;
    }
}

final class BracketChecker {
    private static final BracketPair[] bracketPairs = {
            new BracketPair('[', ']'),
            new BracketPair('(', ')'),
            new BracketPair('{', '}'),
    };

    private boolean matched;

    public BracketChecker(String input) {
        matched = checkMatched(input);
    }

    public boolean areBracketsMatchedAndNestedCorrectly() {
        return matched;
    }

    private boolean checkMatched(String input) {
        Stack<Character> brackets = new Stack<>();

        for (int i = 0; i < input.length(); i++) {
            char c = input.charAt(i);

            for (BracketPair bracketPair: bracketPairs) {
                if (c == bracketPair.getOpen())
                    brackets.push(c);
                else if (c == bracketPair.getClose())
                    if (brackets.empty() || brackets.pop() != bracketPair.getOpen())
                        return false;
            }
        }

        return brackets.empty();
    }
}
