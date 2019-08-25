% Please visit https://exercism.io/tracks/prolog/installation
% for instructions on setting up prolog.
% Visit https://exercism.io/tracks/prolog/tests
% for help running the tests for prolog exercises.

% The goal below allows tests to be skipped
% unless the "--all" flag is passed at
% the command line.

pending :-
    current_prolog_flag(argv, ['--all'|_]).
pending :-
    write('\nA TEST IS PENDING!\n'),
    fail.

:- begin_tests(hello_world).

    test(hello_world, condition(true)) :-
        hello_world('Hello World!').

    % Once the first test passes, un-skip the following test by
    % changing `pending` in `condition(pending)` to `true`.
    % Repeat for each test until they are all passing.

:- end_tests(hello_world).
