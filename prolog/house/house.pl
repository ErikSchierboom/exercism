subject(1, "the house that Jack built").
subject(2, "the malt that lay in").
subject(3, "the rat that ate").
subject(4, "the cat that killed").
subject(5, "the dog that worried").
subject(6, "the cow with the crumpled horn that tossed").
subject(7, "the maiden all forlorn that milked").
subject(8, "the man all tattered and torn that kissed").
subject(9, "the priest all shaven and shorn that married").
subject(10, "the rooster that crowed in the morn that woke").
subject(11, "the farmer sowing his corn that kept").
subject(12, "the horse and the hound and the horn that belonged to").

combine(Part, "", Part) :- !.
combine(Part, Acc, Result) :- format(string(Result), "~s ~s", [Part, Acc]).

verse(N, Lyric) :-
    numlist(1, N, Ns),
    maplist(subject, Ns, Parts),
    foldl(combine, Parts, "", Subjects),
    format(string(Lyric), "This is ~s.", [Subjects]).

recite(Verse, Lyrics) :- recite(Verse, Verse, Lyrics).
recite(From, To, Lyrics) :-
    numlist(From, To, Ns),
    maplist(verse, Ns, Lyrics).
