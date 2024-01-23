module bob;

import std.string;

string hey(string sentence)
{
    if (sentence.isSilence)
        return "Fine. Be that way!";
    if (sentence.isQuestion && sentence.isShout)
        return "Calm down, I know what I'm doing!";
    if (sentence.isQuestion)
        return "Sure.";
    if (sentence.isShout)
        return "Whoa, chill out!";

    return "Whatever.";
}

bool isSilence(string sentence)
{
    return sentence.strip.length == 0;
}

bool isQuestion(string sentence)
{
    return sentence.stripRight.endsWith("?");
}

bool isShout(string sentence)
{
    return sentence.toUpper == sentence && sentence.toLower != sentence;
}

unittest
{
    immutable int allTestsEnabled = 1;

    // Stating something
    assert(hey("Tom-ay-to, tom-aaaah-to.") == "Whatever.");

    static if (allTestsEnabled)
    {
        // Shouting
        assert(hey("WATCH OUT!") == "Whoa, chill out!");

        // Shouting gibberish
        assert(hey("FCECDFCAAB") == "Whoa, chill out!");

        // Asking a question
        assert(hey("Does this cryogenic chamber make me look fat?") == "Sure.");

        // Asking a numeric question
        assert(hey("You are, what, like 15?") == "Sure.");

        // Asking gibberish
        assert(hey("fffbbcbeab?") == "Sure.");

        // Talking forcefully
        assert(hey("Hi there!") == "Whatever.");

        // Using acronyms in regular speech
        assert(hey("It's OK if you don't want to go work for NASA.") == "Whatever.");

        // Forceful question
        assert(hey("WHAT'S GOING ON?") == "Calm down, I know what I'm doing!");

        // Shouting numbers
        assert(hey("1, 2, 3 GO!") == "Whoa, chill out!");

        // No letters
        assert(hey("1, 2, 3") == "Whatever.");

        // Question with no letters
        assert(hey("4?") == "Sure.");

        // Shouting with special characters
        assert(hey("ZOMG THE %^*@#$(*^ ZOMBIES ARE COMING!!11!!1!") == "Whoa, chill out!");

        // Shouting with no exclamation mark
        assert(hey("I HATE THE DENTIST") == "Whoa, chill out!");

        // Statement containing question mark
        assert(hey("Ending with a ? means a question.") == "Whatever.");

        // Non-letters with question
        assert(hey(":) ?") == "Sure.");

        // Prattling on
        assert(hey("Wait! Hang on. Are you going to be OK?") == "Sure.");

        // Silence
        assert(hey("") == "Fine. Be that way!");

        // Prolonged silence
        assert(hey("          ") == "Fine. Be that way!");

        // Alternate silence
        assert(hey("\t\t\t\t\t\t\t\t\t\t") == "Fine. Be that way!");

        // Multiple line question
        assert(hey("\nDoes this cryogenic chamber make me look fat?\nNo.") == "Whatever.");

        // Ending with whitespace
        assert(hey("Okay if like my  spacebar  quite a bit?   ") == "Sure.");

        // Other whitespace
        assert(hey("\n\r \t") == "Fine. Be that way!");

        // Non-question ending with whitespace
        assert(hey("This is a statement ending with whitespace      ") == "Whatever.");
    }

}
