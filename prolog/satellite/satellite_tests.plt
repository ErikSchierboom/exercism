pending :-
    current_prolog_flag(argv, ['--all'|_]).
pending :-
    write('\nA TEST IS PENDING!\n'),
    fail.

:- begin_tests(tree_traversals).

    test(inorder_from_empty_tree, condition(true)) :-
        Tree = nil,
        tree_traversals(Tree, Inorder, _),
        Inorder == [].

    test(inorder_from_single_node_tree, condition(pending)) :-
        Tree = node(nil, a, nil),
        tree_traversals(Tree, Inorder, _),
        Inorder == [a].

    test(inorder_from_tree_with_two_leafs, condition(pending)) :-
        Tree = node(node(nil, b, nil), a, node(nil, c, nil)),
        tree_traversals(Tree, Inorder, _),
        Inorder == [a, b, c].

    test(inorder_from_nested_tree, condition(pending)) :-
        Tree = node(node(nil, b, nil), a, node(node(node(nil, e, nil), d, nil), c, nil)),
        tree_traversals(Tree, Inorder, _),
        Inorder == [a, b, c, d, e].

    test(preorder_from_empty_tree, condition(pending)) :-
        Tree = nil,
        tree_traversals(Tree, _, Preorder),
        Preorder == [].

    test(preorder_from_single_node_tree, condition(pending)) :-
        Tree = node(nil, a, nil),
        tree_traversals(Tree, _, Preorder),
        Preorder == [a].

    test(preorder_from_tree_with_two_leafs, condition(pending)) :-
        Tree = node(node(nil, b, nil), a, node(nil, c, nil)),
        tree_traversals(Tree, _, Preorder),
        Preorder == [b, a, c].

    test(inorder_from_nested_tree, condition(pending)) :-
        Tree = node(node(nil, b, nil), a, node(node(node(nil, e, nil), d, nil), c, nil)),
        tree_traversals(Tree, _, Preorder),
        Preorder == [b, a, e, d, c].

    test(tree_from_empty_inorder_and_preorder_paths, condition(pending)) :-
        Inorder = [],
        Preorder = [],
        tree_traversals(Tree, Inorder, Preorder),
        Tree == nil.

    test(tree_from_inorder_and_preorder_paths_with_one_element, condition(pending)) :-
        Inorder = [a],
        Preorder = [a],
        tree_traversals(Tree, Inorder, Preorder),
        Tree == node(nil, a, nil).

    test(tree_from_inorder_and_preorder_paths_for_nested_tree, condition(pending)) :-
        Inorder = [a, b, c, d, e],
        Preorder = [b, a, e, d, c],
        tree_traversals(Tree, Inorder, Preorder),
        Tree == node(node(nil, b, nil), a, node(node(node(nil, e, nil), d, nil), c, nil)).

    test(cannot_create_tree_from_inorder_and_preorder_paths_with_different_lengths, [condition(pending), fail]) :-
        Inorder = [a, b, c],
        Preorder = [b, a],
        tree_traversals(_, Inorder, Preorder).

    test(cannot_create_tree_from_inorder_and_preorder_paths_with_different_elements, [condition(pending), fail]) :-
        Inorder = [a, b, c],
        Preorder = [e, d, f],
        tree_traversals(_, Inorder, Preorder).

:- end_tests(tree_traversals).
