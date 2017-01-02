import org.jparsec.*;

final class WordProblemSolver {
    public int solve(String question) {
        try {
            return CALCULATOR.parse(question);
        } catch (Exception ex) {
            throw new IllegalArgumentException("I'm sorry, I don't understand the question!");
        }
    }

    static final Parser<Integer> NUMBER =
            Terminals.DecimalLiteral.PARSER.map(Integer::valueOf);

    private static final Terminals OPERATORS =
            Terminals.operators("-", "plus", "minus", "divided by", "multiplied by");

    static final Parser<Void> IGNORED = Parsers.or(
            Scanners.string("What is"),
            Scanners.string("?"),
            Scanners.WHITESPACES).skipMany();

    static final Parser<?> TOKENIZER =
            Parsers.or(Terminals.DecimalLiteral.TOKENIZER, OPERATORS.tokenizer());

    static Parser<?> term(String... names) {
        return OPERATORS.token(names);
    }

    static <T> Parser<T> op(String name, T value) {
        return term(name).retn(value);
    }

    static Parser<Integer> calculator(Parser<Integer> atom) {
        return new OperatorTable<Integer>()
                .infixl(op("plus",          (l, r) -> l + r), 10)
                .infixl(op("minus",         (l, r) -> l - r), 10)
                .infixl(op("divided by",    (l, r) -> l / r), 10)
                .infixl(op("multiplied by", (l, r) -> l * r), 10)
                .prefix(op("-", v -> -v), 20)
                .build(atom);
    }

    public static final Parser<Integer> CALCULATOR =
        calculator(NUMBER).from(TOKENIZER, IGNORED);
}
