zebra_owner(Owner) :- 
	solution(Houses),
	member(house(Owner, zebra, _, _, _), Houses), !.

water_drinker(Drinker) :-
	solution(Houses),
	member(house(Drinker, _, _, water, _), Houses), !.

solution(Houses) :-
	length(Houses, 5),
	member(house(english, _, _, _, red), Houses),
	member(house(spanish, dog, _, _, _), Houses),
	member(house(_, _, _, coffee, green), Houses),
	member(house(ukrainian, _, _, tea, _), Houses),
	next_to(house(_, _, _, _, green), house(_, _, _, _, white), Houses),
	member(house(_, snake, winston, _, _), Houses),
	member(house(_, _, kool, _, yellow), Houses),
	Houses = [_, _, house(_, _, _, milk, _), _, _],
	Houses = [house(norwegian, _, _, _, _)|_],
	next_to(house(_, fox, _, _, _), house(_, _, chesterfield, _, _), Houses),
	next_to(house(_, _, kool, _, _), house(_, horse, _, _, _), Houses),
	member(house(_, _, lucky, juice, _), Houses),
	member(house(japanese, _, kent, _, _), Houses),
	next_to(house(norwegian, _, _, _, _), house(_, _, _, _, blue), Houses).

next_to(X, Y, List) :- append(_, [X, Y|_], List); append(_, [Y, X|_], List).
