say(0, "zero") :- !.
say(1, "one") :- !.
say(2, "two") :- !.
say(3, "three") :- !.
say(4, "four") :- !.
say(5, "five") :- !.
say(6, "six") :- !.
say(7, "seven") :- !.
say(8, "eight") :- !.
say(9, "nine") :- !.
say(10, "ten") :- !.
say(11, "eleven") :- !.
say(12, "twelve") :- !.
say(13, "thirteen") :- !.
say(14, "fourteen") :- !.
say(15, "fifteen") :- !.
say(16, "sixteen") :- !.
say(17, "seventeen") :- !.
say(18, "eighteen") :- !.
say(19, "nineteen") :- !.

say(20, "twenty") :- !.
say(30, "thirty") :- !.
say(40, "forty") :- !.
say(50, "fifty") :- !.
say(60, "sixty") :- !.
say(70, "seventy") :- !.
say(80, "eighty") :- !.
say(90, "ninety") :- !.

say(N, English) :-
    between(10, 99, N),
    Remainder is N mod 10,
    Tens is N - Remainder,
    say(Tens, TensEnglish),
    say(Remainder, RemainderEnglish),
    format(string(English), "~s-~s", [TensEnglish, RemainderEnglish]), !.

say(N, English) :- say(N, 100, 999, "hundred", English), !.
say(N, English) :- say(N, 1000, 999999, "thousand", English), !.
say(N, English) :- say(N, 1000000, 999999999, "million", English), !.
say(N, English) :- say(N, 1000000000, 999999999999, "billion", English).

say(Units, 0, Unit, English) :-
    say(Units, UnitsEnglish),
    format(string(English), "~s ~s", [UnitsEnglish, Unit]), !.
say(Units, Remainder, Unit, English) :-
    say(Units, UnitsEnglish),
    say(Remainder, RemainderEnglish),
    format(string(English), "~s ~s ~s", [UnitsEnglish, Unit, RemainderEnglish]).

say(N, Low, High, Unit, English) :-
    between(Low, High, N),
    divmod(N, Low, Units, Remainder),
    say(Units, Remainder, Unit, English).
