:- use_module(library(dcg/basics)).

preorder_tree_nodes(nil) --> [].
preorder_tree_nodes(node(Left, Name, Right)) -->
    [Name],
    preorder_tree_nodes(Left),
    preorder_tree_nodes(Right).

inorder_tree_nodes(nil) --> [].
inorder_tree_nodes(node(Left, Name, Right)) -->
    inorder_tree_nodes(Left),
    [Name],
    inorder_tree_nodes(Right).

tree_traversals(Tree, Preorder, Inorder) :-
    phrase(preorder_tree_nodes(Tree),Preorder),
    phrase(inorder_tree_nodes(Tree),Inorder).
