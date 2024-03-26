string_lower_codes(String, Codes) :-
    string_lower(String, Lower),
    string_codes(Lower, Codes).

is_anagram(Word, Candidate) :-
    string_lower_codes(Word, WordCodes),
    string_lower_codes(Candidate, CandidateCodes),
    permutation(WordCodes, CandidateCodes),
    WordCodes \== CandidateCodes.

anagram(Word, Candidates, Anagrams) :-
    include(is_anagram(Word), Candidates, Anagrams).
