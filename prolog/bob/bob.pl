:- use_module(library(dcg/basics)).

... --> [] | [_], ... .

non_lower --> [C], { nonvar(C), \+ code_type(C, 'lower') }.
non_lowers --> non_lower, non_lowers.
non_lowers --> [].

upper --> [C], { nonvar(C), code_type(C, 'upper') }.

silence --> blanks, eol.
question --> ..., "?", blanks, eol.
yell --> non_lowers, upper, non_lowers, eol.

matches(Sentence, Pattern) :-
    string_codes(Sentence, SentenceChars),
    phrase(Pattern, SentenceChars).

hey(Sentence, "Fine. Be that way!") :- matches(Sentence, silence), !.
hey(Sentence, "Calm down, I know what I'm doing!") :- matches(Sentence, yell), matches(Sentence, question), !.
hey(Sentence, "Sure.") :- matches(Sentence, question), !.
hey(Sentence, "Whoa, chill out!") :- matches(Sentence, yell), !.
hey(_, "Whatever.") :- !.
