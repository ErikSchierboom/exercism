const int LOWER_A_CODEPOINT = 97;
const int LOWER_Z_CODEPOINT = 122;
const int ALL_LETTERS_MASK = 67108863;

public function isPangram(string sentence) returns boolean {
    int alphabetMask = 0;

    foreach int c in sentence.toLowerAscii().toCodePointInts() {
        if c >= LOWER_A_CODEPOINT && c <= LOWER_Z_CODEPOINT {
            alphabetMask |= 1 << (c - LOWER_A_CODEPOINT);
        }

        if alphabetMask == ALL_LETTERS_MASK {
            return true;
        }
    }

    return false;
}
