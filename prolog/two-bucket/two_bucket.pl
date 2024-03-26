:- use_module(library(clpfd)).

action((_,MaxB), (A, B), (A1, B1)) :- 
    A #> 0, B #< MaxB,
    Fill #= min(A, MaxB - B),
    A1 #= A - Fill,
    B1 #= B + Fill.
action((_,_), (A, B), (A, 0)) :- B #> 0.
action((MaxA,_), (A, B), (MaxA, B)) :- A #< MaxA.

measurement(Visited, GoalBucket, OtherBucket, Measurement) :-
    length(Visited, Moves),
    Measurement = measurement(moves(Moves), goalBucket(GoalBucket), otherBucket(OtherBucket)).

solve(Goal, (MaxA, Goal), (0, 0), _, Measurement) :- measurement([(MaxA, Goal), (MaxA, 0)], two, MaxA, Measurement).
solve(Goal, _, (Goal, Other), Visited, Measurement) :- measurement(Visited, one, Other, Measurement).
solve(Goal, _, (Other, Goal), Visited, Measurement) :- measurement(Visited, two, Other, Measurement).
solve(Goal, Capacity, State, Visited, Measurement) :-
    action(Capacity, State, Next),
    \+ member(Next, Visited),
    solve(Goal, Capacity, Next, [State|Visited], Measurement).

flip_measurement(measurement(Moves, goalBucket(one), Other), measurement(Moves, goalBucket(two), Other)).
flip_measurement(measurement(Moves, goalBucket(two), Other), measurement(Moves, goalBucket(one), Other)).

measure(MaxA, MaxB, Goal, one, Measurement) :-
    solve(Goal, (MaxA, MaxB), (MaxA, 0), [(MaxA, 0)], Measurement), !.

measure(MaxA, MaxB, Goal, two, Measurement) :-
    solve(Goal, (MaxB, MaxA), (MaxB, 0), [(MaxB, 0)], FlippedMeasurement),
    flip_measurement(FlippedMeasurement, Measurement), !.
