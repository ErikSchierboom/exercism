pangram(Sentence) :-
    string_lower(Sentence, LowerSentence),
    atom_codes(LowerSentence, SentenceCodes),
    atom_codes("abcdefghijklmnopqrstuvwxyz", AlphabetCodes),
    subset(AlphabetCodes, SentenceCodes).
