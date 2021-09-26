:- use_module(library(dcg/basics)).

minus(X, Y, Result) :- Result is X - Y.
multiply(X, Y, Result) :- Result is X * Y.
divide(X, Y, Result) :- Result is X / Y.

invalid_question :- throw(error(syntax_error, "Invalid question")).
unknown_operation :- throw(error(unknown_operation_error, "Unknown operation.")).

:- table expression/3.
expression(Result, Operator, Op) --> expression(N), " ", Operator, " ", integer(M), {call(Op, N, M, Result)}, !.
expression(Result) --> expression(Result, "plus", plus), !.
expression(Result) --> expression(Result, "minus", minus), !.
expression(Result) --> expression(Result, "multiplied by", multiply), !.
expression(Result) --> expression(Result, "divided by", divide), !.
expression(Result) --> integer(Result), !.
expression(_) -->  integer(_), " ", { unknown_operation }.

equation(Result) --> "What is ", expression(Result), "?".
equation(_) --> "What is", { invalid_question }.
equation(_) --> { unknown_operation }.

wordy(Question, Result) :- 
    atom_codes(Question, Codes),
    phrase(equation(Result), Codes), !.
