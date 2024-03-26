animals(["fly", "spider", "bird", "cat", "dog", "goat", "cow", "horse"]).

animal_remark("fly", "I don't know why she swallowed the fly. Perhaps she'll die.").
animal_remark("spider", "It wriggled and jiggled and tickled inside her.").
animal_remark("bird", "How absurd to swallow a bird!").
animal_remark("cat", "Imagine that, to swallow a cat!").
animal_remark("dog", "What a hog, to swallow a dog!").
animal_remark("goat", "Just opened her throat and swallowed a goat!").
animal_remark("cow", "I don't know how she swallowed a cow!").
animal_remark("horse", "She's dead, of course!").

swallowed_animals(Count, SwallowedAnimals) :-
    animals(Animals),
    append(SwallowedAnimalsReversed, _, Animals),
    length(SwallowedAnimalsReversed, Count),
    reverse(SwallowedAnimalsReversed, SwallowedAnimals),
    !.

pairs([X,Y|Tail], [X-Y|Pairs]) :- pairs([Y|Tail], Pairs), !.
pairs(_, []) :- !.

verse_start(Animal, [Line,Remark]) :-
    format(string(Line), 'I know an old lady who swallowed a ~s.', [Animal]),
    animal_remark(Animal, Remark).

verse_end(Line) :- animal_remark("fly", Line).

verse_swallowed(Swalllowed-"spider", Line) :-
    string_concat("spider", " that wriggled and jiggled and tickled inside her", CaughtSpider),
    verse_swallowed(Swalllowed-CaughtSpider, Line).

verse_swallowed(Swalllowed-Caught, Line) :-
    format(string(Line), "She swallowed the ~w to catch the ~w.", [Swalllowed, Caught]).

verse(1, Lyrics) :- verse_start("fly", Lyrics), !.
verse(8, Lyrics) :- verse_start("horse", Lyrics), !.

verse(N, Lyrics) :-
    swallowed_animals(N, SwallowedAnimals),
    [FirstAnimal|_] = SwallowedAnimals,
    pairs(SwallowedAnimals, SwallowedAnimalsPair),
    maplist(verse_swallowed, SwallowedAnimalsPair, SwallowedLines),
    verse_start(FirstAnimal, Start),
    verse_end(End),
    append(Start, SwallowedLines, Lyrics1),
    append(Lyrics1, [End], Lyrics),
    !.

combine_verses([], []).
combine_verses([Verse], Verse).
combine_verses([Verse|Rest], Verses) :-
    combine_verses(Rest, RestVerses),
    append(Verse,[""|RestVerses], Verses).

recite(StartVerse, EndVerse, Lyrics) :-
  numlist(StartVerse, EndVerse, VerseNumbers),
  maplist(verse, VerseNumbers, Verses),
  combine_verses(Verses, Lyrics), !.
