:- use_module(library(dcg/basics)).

preorder(nil) --> [].
preorder(node(L, V, R)) --> [V], preorder(L), preorder(R).

inorder(nil) --> [].
inorder(node(L, V, R)) --> inorder(L), [V], inorder(R).

tree_traversals(Tree, Preorder, Inorder) :-
    phrase(preorder(Tree), Preorder),
    phrase(inorder(Tree), Inorder),
    !.
