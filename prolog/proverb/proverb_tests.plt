pending :-
    current_prolog_flag(argv, ['--all'|_]).
pending :-
    write('\nA TEST IS PENDING!\n'),
    fail.

:- begin_tests(proverb).

    test(zero_pieces, condition(true)) :-
        proverb([], Lines),
        Lines == [].

    test(one_piece, condition(pending)) :-
        proverb(["nail"], Lines),
        Lines == ["And all for the want of a nail."].

    test(two_pieces, condition(pending)) :-
        proverb(["nail", "shoe"], Lines),
        Lines == [
            "For want of a nail the shoe was lost.",
            "And all for the want of a nail."
        ].

    test(three_pieces, condition(pending)) :-
        proverb(["nail", "shoe", "horse"], Lines),
        Lines == [
            "For want of a nail the shoe was lost.",
            "For want of a shoe the horse was lost.",
            "And all for the want of a nail."
        ].

    test(full_proverb, condition(pending)) :-
        proverb(["nail", "shoe", "horse", "rider", "message", "battle", "kingdom"], Lines),
        Lines == [
            "For want of a nail the shoe was lost.",
            "For want of a shoe the horse was lost.",
            "For want of a horse the rider was lost.",
            "For want of a rider the message was lost.",
            "For want of a message the battle was lost.",
            "For want of a battle the kingdom was lost.",
            "And all for the want of a nail."
        ].

    test(four_pieces_modernized, condition(pending)) :-
        proverb(["pin", "gun", "soldier", "battle"], Lines),
        Lines == [
            "For want of a pin the gun was lost.",
            "For want of a gun the soldier was lost.",
            "For want of a soldier the battle was lost.",
            "And all for the want of a pin."
        ].

:- end_tests(proverb).
