public function anagrams(string word, string[] candidates) returns string[] {
    return candidates.filter(candidate =>
        !candidate.equalsIgnoreCaseAscii(word) &&
        word.toLowerAscii().toCodePointInts().sort() == candidate.toLowerAscii().toCodePointInts().sort()
    );
}
