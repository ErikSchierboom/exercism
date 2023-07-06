#include "bob.h"

#include <algorithm>

namespace bob {
    const std::string WHITESPACE = " \t\r\n";
    const std::string LOWER_CHARS = "abcdefghijklmnopqrstuvwxyz";
    const std::string UPPER_CHARS = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";

    static inline bool is_silence(const std::string sentence) {
        return sentence.find_first_not_of(WHITESPACE) == std::string::npos;
    }

    static inline bool is_question(const std::string sentence) {
        return sentence[sentence.find_last_not_of(WHITESPACE)] == '?';
    }

    static inline bool is_shout(const std::string sentence) {
        return sentence.find_first_of(UPPER_CHARS) != std::string::npos &&
               sentence.find_first_of(LOWER_CHARS) == std::string::npos;
    }

    std::string hey(std::string sentence) {
        if (is_silence(sentence)) return "Fine. Be that way!";
        if (is_question(sentence) && is_shout(sentence)) return "Calm down, I know what I'm doing!";
        if (is_question(sentence)) return "Sure.";
        if (is_shout(sentence)) return "Whoa, chill out!";

        return "Whatever.";
    }
}  // namespace bob
