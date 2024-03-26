:- use_module(library(dcg/basics)).
:- use_module(library(dcg/high_order)).
:- set_prolog_flag(double_quotes, chars).

char(' ') --> "\t" | "\\\t".
char(C) --> "\\\n", char(C).
char(C) --> "\\", [C], { member(C, "tn]\\")}.
char(C) --> [C], { C \== ']' }.
text(Text) --> sequence(char, Chars), { string_chars(Text, Chars) }.

value(Value) --> "[", text(Value) , "]".
values(Values) --> sequence(value, Values), { length(Values, Length), Length > 0 }.

key(Key) --> [C], { char_type(C, upper), string_chars(Key, [C]) }.

prop(Key-Values) --> key(Key), values(Values).

child(Tree) --> basic_tree(Tree).
child(Tree) --> shorthand_tree(Tree).

basic_tree(Tree) --> ";", 
    sequence(prop, Properties),
    sequence(child, Children),
    { Tree = sgf_tree(properties(Properties), children(Children))}.

shorthand_tree(Tree) --> "(", basic_tree(Tree), ")".

parse(Input, Tree) :-
    string_chars(Input, Chars),
    phrase(shorthand_tree(Tree), Chars),
    !.
