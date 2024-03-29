lower_chars(String, Chars) :-
    string_lower(String, Lower),
    string_chars(Lower, Chars).

is_anagram(Word, Candidate) :-
    lower_chars(Word, WordChars),
    lower_chars(Candidate, CandidateChars),
    permutation(WordChars, CandidateChars),
    WordChars \== CandidateChars.

anagram(Word, Candidates, Anagrams) :-
    include(is_anagram(Word), Candidates, Anagrams).
