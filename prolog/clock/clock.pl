:- use_module(library(clpfd)).

create_clock(Hours, Minutes, clock(NormalizedMinutes)) :-
    NormalizedMinutes #= (Hours * 60 + Minutes) mod 1440.

display(clock(NormalizedMinutes), Time) :-
    Hours #= NormalizedMinutes // 60,
    Minutes #= NormalizedMinutes mod 60,
    format(string(Time), "~|~`0t~d~2+:~|~`0t~d~2+", [Hours, Minutes]).

add_minutes(clock(NormalizedMinutes), Minutes, NewClock) :-
    NewMinutes #= NormalizedMinutes + Minutes,
    create_clock(0, NewMinutes, NewClock).

subtract_minutes(Clock, Minutes, NewClock) :-
    add_minutes(Clock, -Minutes, NewClock).
