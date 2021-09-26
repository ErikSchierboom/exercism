pending :-
    current_prolog_flag(argv, ['--all'|_]).
pending :-
    write('\nA TEST IS PENDING!\n'),
    fail.

:- begin_tests(plus).

    test(just_a_number, condition(true)) :-
        wordy("What is 5?", 5).

    test(addition, condition(true)) :-
        wordy("What is 1 plus 1?", 2).

    test(more_addition, condition(true)) :-
        wordy("What is 53 plus 2?", 55).

    test(addition_with_negative_numbers, condition(true)) :-
        wordy("What is -1 plus -10?", -11).

    test(large_addition, condition(true)) :-
        wordy("What is 123 plus 45678?", 45801).

:- end_tests(plus).
:- begin_tests(minus).

    test(subtraction, condition(true)) :-
        wordy("What is 4 minus -12?", 16).

:- end_tests(minus).
:- begin_tests(multiplication).

    test(multiplication, condition(true)) :-
        wordy("What is -3 multiplied by 25?", -75).

:- end_tests(multiplication).
:- begin_tests(division).

    test(division, condition(true)) :-
        wordy("What is 33 divided by -3?", -11).

:- end_tests(division).
:- begin_tests(combination).

    test(multiple_additions, condition(true)) :-
        wordy("What is 1 plus 1 plus 1?", 3).

    test(addition_and_subtraction, condition(true)) :-
        wordy("What is 1 plus 5 minus -2?", 8).

    test(multiple_subtraction, condition(true)) :-
        wordy("What is 20 minus 4 minus 13?", 3).

    test(subtraction_then_addition, condition(true)) :-
        wordy("What is 17 minus 6 plus 3?", 14).

    test(multiple_multiplication, condition(true)) :-
        wordy("What is 2 multiplied by -2 multiplied by 3?", -12).

    test(addition_and_multiplication, condition(true)) :-
        wordy("What is -3 plus 7 multiplied by -2?", -8).

    test(multiple_division, condition(true)) :-
        wordy("What is -12 divided by 2 divided by -3?", 2).

:- end_tests(combination).
:- begin_tests(errors).

    test(unknown_operation, [error(unknown_operation_error), condition(true)]) :-
        wordy("What is 52 cubed?", 140608).

    test(non_math_question, [error(unknown_operation_error), condition(true)]) :-
        wordy("Who is the President of the United States?", "Abraham Lincoln").

    test(reject_problem_missing_an_operand, [error(syntax_error), condition(true)]) :-
        wordy("What is 1 plus?", _).

    test(reject_problem_with_no_operands_or_operators, [error(syntax_error), condition(true)]) :-
        wordy("What is?", _).

    test(reject_two_operations_in_a_row, [error(syntax_error), condition(true)]) :-
        wordy("What is 1 plus plus 2?", _).

    test(reject_two_numbers_in_a_row, [error(syntax_error), condition(true)]) :-
        wordy("What is 1 plus 2 1?", _).

    test(reject_postfix_notation, [error(syntax_error), condition(true)]) :-
        wordy("What is 1 2 plus?", _).

    test(reject_prefix_notation, [error(syntax_error), condition(true)]) :-
        wordy("What is plus 1 2?", _).

:- end_tests(errors).
