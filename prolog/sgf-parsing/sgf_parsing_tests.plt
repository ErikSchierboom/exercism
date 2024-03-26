pending :-
    current_prolog_flag(argv, ['--all'|_]).
pending :-
    write('\nA TEST IS PENDING!\n'),
    fail.

:- begin_tests(sgf_parsing).

    test(empty_input, [fail, condition(true)]) :-
        parse("", _).

    test(tree_with_no_nodes, [fail, condition(pending)]) :-
        parse("()", _).

    test(node_without_tree, [fail, condition(pending)]) :-
        parse(";", _).

    test(node_without_properties, condition(pending)) :-
        parse("(;)", Tree),
        Tree == sgf_tree(properties([]), children([])).

    test(single_node_tree, condition(pending)) :-
        parse("(;A[B])", Tree),
        Tree == sgf_tree(properties(["A"-["B"]]), children([])).

    test(multiple_properties, condition(pending)) :-
        parse("(;A[b]C[d])", Tree),
        Tree == sgf_tree(properties(["A"-["b"], "C"-["d"]]), children([])).

    test(properties_without_delimiter, [fail, condition(pending)]) :-
        parse("(;A)", _).

    test(all_lowercase_property, [fail, condition(pending)]) :-
        parse("(;a[b])", _).

    test(upper_and_lowercase_property, [fail, condition(pending)]) :-
        parse("(;Aa[b])", _).

    test(two_nodes, condition(pending)) :-
        parse("(;A[B];B[C])", Tree),
        Tree == sgf_tree(properties(["A"-["B"]]), children([sgf_tree(properties(["B"-["C"]]), children([]))])).

    test(two_child_trees, condition(pending)) :-
        parse("(;A[B](;B[C])(;C[D]))", Tree),
        Tree == sgf_tree(
            properties(["A"-["B"]]),
            children([
                sgf_tree(properties(["B"-["C"]]), children([])), 
                sgf_tree(properties(["C"-["D"]]), children([]))
            ])
        ).

    test(multiple_property_values, condition(pending)) :-
        parse("(;A[b][c][d])", Tree),
        Tree == sgf_tree(properties(["A"-["b", "c", "d"]]), children([])).

    test(within_property_values_whitespace_characters_such_as_tab_are_converted_to_spaces, condition(pending)) :-
        parse("(;A[hello\t\tworld])", Tree),
        Tree == sgf_tree(properties(["A"-["hello  world"]]), children([])).

    test(within_property_values_newlines_remain_as_newlines, condition(pending)) :-
        parse("(;A[hello\n\nworld])", Tree),
        Tree == sgf_tree(properties(["A"-["hello\n\nworld"]]), children([])).

    test(escaped_closing_bracket_within_property_value_becomes_just_a_closing_bracket, condition(pending)) :-
        parse("(;A[\\]])", Tree),
        Tree == sgf_tree(properties(["A"-["]"]]), children([])).

    test(escaped_backslash_in_property_value_becomes_just_a_backslash, condition(pending)) :-
        parse("(;A[\\\\])", Tree),
        Tree == sgf_tree(properties(["A"-["\\"]]), children([])).

    test(opening_bracket_within_property_value_doesn_t_need_to_be_escaped, condition(pending)) :-
        parse("(;A[x[y\\]z][foo]B[bar];C[baz])", Tree),
        Tree == sgf_tree(
            properties(["A"-["x[y]z", "foo"], "B"-["bar"]]),
            children([sgf_tree(properties(["C"-["baz"]]), children([]))])).

    test(semicolon_in_property_value_doesn_t_need_to_be_escaped, condition(pending)) :-    
        parse("(;A[a;b][foo]B[bar];C[baz])", Tree),
        Tree == sgf_tree(
            properties(["A"-["a;b", "foo"], "B"-["bar"]]),
            children([sgf_tree(properties(["C"-["baz"]]), children([]))])).

    test(parentheses_in_property_value_don_t_need_to_be_escaped, condition(pending)) :-    
        parse("(;A[x(y)z][foo]B[bar];C[baz])", Tree),
        Tree == sgf_tree(
            properties(["A"-["x(y)z", "foo"], "B"-["bar"]]),
            children([sgf_tree(properties(["C"-["baz"]]), children([]))])
        ).

    test(escaped_tab_in_property_value_is_converted_to_space, condition(pending)) :-
        parse("(;A[hello\\\tworld])", Tree),
        Tree == sgf_tree(properties(["A"-["hello world"]]), children([])).

    test(escaped_newline_in_property_value_is_converted_to_nothing_at_all, condition(pending)) :-
        parse("(;A[hello\\\nworld])", Tree),
        Tree == sgf_tree(properties(["A"-["helloworld"]]), children([])).

    test(escaped_t_and_n_in_property_value_are_just_letters_not_whitespace, condition(pending)) :-
        parse("(;A[\\t = t and \\n = n])", Tree),
        Tree == sgf_tree(properties(["A"-["t = t and n = n"]]), children([])).

    test(mixing_various_kinds_of_whitespace_and_escaped_characters_in_property_value, condition(pending)) :-
        parse("(;A[\\]b\nc\\\nd\t\te\\\\ \\\n\\]])", Tree),
        Tree == sgf_tree(properties(["A"-["]b\ncd  e\\ ]"]]), children([])).

:- end_tests(sgf_parsing).
