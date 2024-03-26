count(0, "No").
count(1, "One").
count(2, "Two").
count(3, "Three").
count(4, "Four").
count(5, "Five").
count(6, "Six").
count(7, "Seven").
count(8, "Eight").
count(9, "Nine").
count(10, "Ten").

lower_count(N, LowerCount) :-
    count(N, Count),
    string_lower(Count, LowerCount).

bottles(1, "bottle") :- !.
bottles(_, "bottles").

hanging_on_the_wall(N, Lyric) :-
    count(N, Count),
    bottles(N, Bottles),
    format(string(Lyric), "~s green ~s hanging on the wall,", [Count, Bottles]).

future_hanging_on_the_wall(N, Lyric) :-
    NextN is N - 1,
    lower_count(NextN, Count),
    bottles(NextN, Bottles),
    format(string(Lyric), "There'll be ~s green ~s hanging on the wall.", [Count, Bottles]).

accidentally_fall("And if one green bottle should accidentally fall,").

verse(N, Lyrics) :- 
    hanging_on_the_wall(N, HangingOnTheWall),
    accidentally_fall(AccidentallyFall),
    future_hanging_on_the_wall(N, FutureHangingOnTheWall),
    Lyrics = [HangingOnTheWall, HangingOnTheWall, AccidentallyFall, FutureHangingOnTheWall].

combine_verses([], []).
combine_verses([Verse], Verse).
combine_verses([Verse|Rest], Verses) :-
    combine_verses(Rest, RestVerses),
    append(Verse,[""|RestVerses], Verses).

recite(Start, Lyrics) :- recite(Start, 1, Lyrics).
recite(Start, Count, Lyrics) :-
    End is Start - (Count - 1),
    numlist(End, Start, VerseNumbers),
    reverse(VerseNumbers, VerseNumbersDescending),
    maplist(verse, VerseNumbersDescending, Verses),
    combine_verses(Verses, Lyrics), !.
