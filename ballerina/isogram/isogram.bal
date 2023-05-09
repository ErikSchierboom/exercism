const int LOWER_A_CODEPOINT = 97;
const int LOWER_Z_CODEPOINT = 122;

public function isIsogram(string sentence) returns boolean {
    int alphabetMask = 0;

    foreach int c in sentence.toLowerAscii().toCodePointInts() {
        if c >= LOWER_A_CODEPOINT && c <= LOWER_Z_CODEPOINT {
            int letterMask = (1 << (c - LOWER_A_CODEPOINT));

            if (alphabetMask & letterMask) != 0 {
                return false;
            }

            alphabetMask |= letterMask;
        }
    }

    return true;
}
