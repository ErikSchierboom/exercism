letters(Letters) :- string_chars("ABCDEFGHIJKLMNOPQRSTUVWXZY", Letters).
digits(Digits) :- string_chars("0123456789", Digits).

generate_name(Name) :-
    letters(Letters),
    digits(Digits),
    random_member(L1, Letters), random_member(L2, Letters),
    random_member(D1, Digits), random_member(D2, Digits), random_member(D3, Digits),
    string_chars(Name, [L1,L2,D1,D2,D3]).

create_robot(Robot) :-
    generate_name(Name),
    Robot = robot(Name).

robot_name(robot(Name), Name).

reset_name(Robot) :-
    generate_name(Name),
    setarg(1, Robot, Name).
