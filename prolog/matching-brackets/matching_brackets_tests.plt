pending :-
    current_prolog_flag(argv, ['--all'|_]).
pending :-
    write('\nA TEST IS PENDING!\n'),
    fail.

:- begin_tests(matching_brackets).

    test(paired_square_brackets, condition(true)) :-
        paired("[]").

    test(empty_string, condition(true)) :-
        paired("").

    test(unpaired_brackets, [fail, condition(true)]) :-
        paired("[[").

    test(wrong_ordered_brackets, [fail, condition(true)]) :-
        paired("}{").

    test(wrong_closing_bracket, [fail, condition(true)]) :-
        paired("{]").

    test(paired_with_whitespace, condition(true)) :-
        paired("{ }").

    test(partially_paired_brackets, [fail, condition(true)]) :-
        paired("{[])").

    test(simple_nested_brackets, condition(true)) :-
        paired("{[]}").

    test(several_paired_brackets, condition(true)) :-
        paired("{}[]").

    test(paired_and_nested_brackets, condition(true)) :-
        paired("([{}({}[])])").

    test(unopened_closing_brackets, [fail, condition(true)]) :-
        paired("{[)][]}").

    test(unpaired_and_nested_brackets, [fail, condition(true)]) :-
        paired("([{])").

    test(paired_and_wrong_nested_brackets, [fail, condition(true)]) :-
        paired("[({]})").

    test(paired_and_wrong_nested_brackets_but_innermost_are_correct, [fail, condition(true)]) :-
        paired("[({}])").

    test(paired_and_incomplete_brackets, [fail, condition(true)]) :-
        paired("{}[").

    test(too_many_closing_brackets, [fail, condition(true)]) :-
        paired("[]]").

    test(early_unexpected_brackets, [fail, condition(true)]) :-
        paired(")()").

    test(early_mismatched_brackets, [fail, condition(true)]) :-
        paired("{)()").

    test(math_expression, condition(true)) :-
        paired("(((185 + 223.85) * 15) - 543)/2").

    test(complex_latex_expression, condition(true)) :-
        paired("\\left(\\begin{array}{cc} \\frac{1}{3} & x\\\\ \\mathrm{e}^{x} &... x^2 \\end{array}\\right)").

:- end_tests(matching_brackets).
