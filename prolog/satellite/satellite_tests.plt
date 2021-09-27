pending :-
    current_prolog_flag(argv, ['--all'|_]).
pending :-
    write('\nA TEST IS PENDING!\n'),
    fail.

:- begin_tests(tree_traversals).

test(build_empty_tree, [condition(true), all( T = [ nil ] )]) :-
    tree_traversals(T,[],[]).

test(build_one_item_tree, [condition(true), all( T = [ node(nil,a,nil) ] )]) :-
    tree_traversals(T,[a],[a]).

test(aix_france, [condition(true), all( Tree = [ 
        node(node(nil, i, nil), a, node(node(nil, f, nil), x, node(nil, r, nil))) 
    ])]) :-
    tree_traversals(Tree, [a,i,x,f,r], [i,a,f,x,r]).

test(diff_length_traversal, [condition(true), fail]) :-
    tree_traversals(_,[a,b],[b,a,r]).

test(diff_node_values_same_length, [condition(true), fail]) :-
    tree_traversals(_,[x,y,z],[a,b,c]).

% Bonus (find multiple trees)

test(with_repetitions, [condition(true), set( Tree = [
        node(node(node(node(node(nil, o, nil), l, nil), o, nil), r, nil), p, node(nil, g, nil))
    ,   node(node(node(nil, o, node(nil, l, node(nil, o, nil))), r, nil), p, node(nil, g, nil))
    ])]) :- 
    tree_traversals(
        Tree
    ,   [p,r,o,l,o,g]
    ,   [o,l,o,r,p,g]
    ).

% basic tests for extra points (unifying in opposite direction)
    
test(find_Inorder_from_empty, condition(true)) :-
    tree_traversals(nil,[],I), I = [].

test(find_Preorder_from_empty, condition(true)) :-
    tree_traversals(nil,P,[]), P = [].

:- end_tests(tree_traversals).
