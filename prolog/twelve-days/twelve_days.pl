day(1, "first").
day(2, "second").
day(3, "third").
day(4, "fourth").
day(5, "fifth").
day(6, "sixth").
day(7, "seventh").
day(8, "eighth").
day(9, "ninth").
day(10, "tenth").
day(11, "eleventh").
day(12, "twelfth").

gift(1, "a Partridge in a Pear Tree").
gift(2, "two Turtle Doves").
gift(3, "three French Hens").
gift(4, "four Calling Birds").
gift(5, "five Gold Rings").
gift(6, "six Geese-a-Laying").
gift(7, "seven Swans-a-Swimming").
gift(8, "eight Maids-a-Milking").
gift(9, "nine Ladies Dancing").
gift(10, "ten Lords-a-Leaping").
gift(11, "eleven Pipers Piping").
gift(12, "twelve Drummers Drumming").

suffix(1, "") :- !.
suffix(2, ", and ") :- !.
suffix(_, ", ").

append_gift(N, Previous, Appended) :-
    gift(N, Gift),
    suffix(N, Suffix),
    format(string(Appended), "~s~s~s", [Gift, Suffix, Previous]).

gifts(N, Gifts) :-
    numlist(1, N, Ns),
    foldl(append_gift, Ns, "", Gifts).

verse(N, Lyric) :-
    day(N, Day),
    gifts(N, Gifts),
    format(string(Lyric), "On the ~s day of Christmas my true love gave to me: ~s.", [Day, Gifts]).

recite(Verse, Lyrics) :- recite(Verse, Verse, Lyrics).
recite(From, To, Lyrics) :-
    numlist(From, To, Ns),
    maplist(verse, Ns, Lyrics).
