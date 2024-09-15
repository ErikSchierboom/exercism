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

    test(inorder_from_tree_without_leafs, condition(pending)) :-
        Tree = node(nil, a, nil),
        tree_traversals(Tree, Inorder, _),
        Inorder == [a].

    test(inorder_from_tree_with_leafs, condition(pending)) :-
        Tree = node(node(nil, b, nil), a, node(nil, c, nil)),
        tree_traversals(Tree, Inorder, _),
        Inorder == [a, b, c].

    test(preorder_from_empty_tree, condition(pending)) :-
        Tree = nil,
        tree_traversals(Tree, _, Preorder),
        Preorder == [].

    test(preorder_from_tree_without_leafs, condition(pending)) :-
        Tree = node(nil, a, nil),
        tree_traversals(Tree, _, Preorder),
        Preorder == [a].

    test(preorder_from_tree_with_leafs, condition(pending)) :-
        Tree = node(node(nil, b, nil), a, node(nil, c, nil)),
        tree_traversals(Tree, _, Preorder),
        Preorder == [b, a, c].

% test(build_one_item_tree, condition(pending)) :-
%     Tree = [node(nil,a,nil)],
%     tree_traversals(Tree, [a], [a]).

% test(aix_france, [condition(pending), all( Tree = [ 
%         node(node(nil, i, nil), a, node(node(nil, f, nil), x, node(nil, r, nil))) 
%     ])]) :-
%     tree_traversals(Tree, [a,i,x,f,r], [i,a,f,x,r]).



% test(diff_node_values_same_length, [condition(pending), fail]) :-
%     tree_traversals(_,[x,y,z],[a,b,c]).


% test(with_repetitions, [condition(pending), set( Tree = [
%         node(node(node(node(node(nil, o, nil), l, nil), o, nil), r, nil), p, node(nil, g, nil))
%     ,   node(node(node(nil, o, node(nil, l, node(nil, o, nil))), r, nil), p, node(nil, g, nil))
%     ])]) :- 
%     tree_traversals(
%         Tree
%     ,   [p,r,o,l,o,g]
%     ,   [o,l,o,r,p,g]
%     ).

% test(diff_length_traversal, [condition(pending), fail]) :-
%     tree_traversals(_,[a,b],[b,a,r]).
    
test(find_inorder_from_empty_tree, condition(pending)) :-
    Tree = nil,
    Preorder = [],
    tree_traversals(Tree, Preorder, Inorder), 
    Inorder = [].

:- end_tests(tree_traversals).
