pending :-
    current_prolog_flag(argv, ['--all'|_]).
pending :-
    write('\nA TEST IS PENDING!\n'),
    fail.

:- begin_tests(knapsack).

    test(no_items, condition(true)) :-
        maximum_value([], 100, Value),
        Value == 0.

    test(one_item_too_heavy, [fail, condition(pending)]) :-
        Weight = 100,
        Value = 1,
        maximum_value([item(Weight, Value)], 10, _).

    test(five_items_cannot_be_greedy_by_weight_, condition(pending)) :-
        maximum_value(
            [
                item(2, 5),
                item(2, 5),
                item(2, 5),
                item(2, 5),
                item(10, 21)
            ],
            10,
            Value
        ),
        Value == 21.

    test(five_items_cannot_be_greedy_by_value_, condition(pending)) :-
        maximum_value(
            [
                item(2, 20),
                item(2, 20),
                item(2, 20),
                item(2, 20),
                item(10, 50)
            ],
            10,
            Value
        ),
        Value == 80.

    test(example_knapsack, condition(pending)) :-
        maximum_value(
            [
                item(5, 10),
                item(4, 40),
                item(6, 30),
                item(4, 50)
            ],
            10,
            Value
        ),
        Value == 90.

    test(eight_items, condition(pending)) :-
        maximum_value(
            [
                item(25, 350),
                item(35, 400),
                item(45, 450),
                item(5, 20),
                item(25, 70),
                item(3, 8),
                item(2, 5),
                item(2, 5)
            ],
            104,
            Value
        ),
        Value == 900.

    test(fifteen_items, condition(pending)) :-
        maximum_value(
            [
                item(70, 135),
                item(73, 139),
                item(77, 149),
                item(80, 150),
                item(82, 156),
                item(87, 163),
                item(90, 173),
                item(94, 184),
                item(98, 192),
                item(106, 201),
                item(110, 210),
                item(113, 214),
                item(115, 221),
                item(118, 229),
                item(120, 240)
            ],
            750,
            Value
        ),
        Value == 1458.

:- end_tests(knapsack).
