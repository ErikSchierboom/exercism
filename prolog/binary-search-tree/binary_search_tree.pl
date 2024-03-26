insert(Data, nil, tree_node(Data, nil, nil)) :- !.
insert(Data, tree_node(TreeData, Left, Right), NewTree) :-
    (Data =< TreeData ->
        insert(Data, Left, NewLeft), NewTree = tree_node(TreeData, NewLeft, Right);
        insert(Data, Right, NewRight), NewTree = tree_node(TreeData, Left, NewRight)).

from_data(Data, Tree) :- foldl(insert, Data, nil, Tree).

to_data(nil, []).
to_data(tree_node(TreeData, Left, Right), Data) :-
    to_data(Left, LeftData),
    to_data(Right, RightData),
    append(LeftData, [TreeData|RightData], Data).
