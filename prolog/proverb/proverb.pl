pairs([X,Y|Tail], [X-Y|Pairs]) :- pairs([Y|Tail], Pairs), !.
pairs(_, []) :- !.

buildup_line(Want-Loss, Line) :-
    format(string(Line), "For want of a ~w the ~w was lost.", [Want, Loss]).

final_line(Want, Line) :- 
    format(string(Line), "And all for the want of a ~w.", [Want]).

proverb([], []).
proverb(Wants, Lines) :-
    [Want|_] = Wants,
    pairs(Wants, Pairs),
    maplist(buildup_line, Pairs, BuildupLines),
    final_line(Want, FinalLine),
    append(BuildupLines, [FinalLine], Lines).
