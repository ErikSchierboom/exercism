pending :-
    current_prolog_flag(argv, ['--all'|_]).
pending :-
    write('\nA TEST IS PENDING!\n'),
    fail.

:- begin_tests(difference_of_squares).

test(square_of_sum_1, condition(true)) :-
  square_of_sum(1, Result),
  Result == 1.

test(square_of_sum_5, condition(true)) :-
  square_of_sum(5, Result),
  Result == 225.

test(square_of_sum_100, condition(true)) :-
  square_of_sum(100, Result),
  Result == 25_502_500.

test(sum_of_squares_1, condition(true)) :-
  sum_of_squares(1, Result),
  Result == 1.

test(sum_of_squares_5, condition(true)) :-
  sum_of_squares(5, Result),
  Result == 55.

test(sum_of_squares_100, condition(true)) :-
  sum_of_squares(100, Result),
  Result == 338_350.

test(difference_of_squares_1, condition(true)) :-
  difference(1, Result),
  Result == 0.

test(difference_of_squares_5, condition(true)) :-
  difference(5, Result),
  Result == 170.

test(difference_of_squares_100, condition(true)) :-
  difference(100, Result),
  Result == 25_164_150.

:- end_tests(difference_of_squares).
