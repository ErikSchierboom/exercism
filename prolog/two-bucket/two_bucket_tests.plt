pending :-
    current_prolog_flag(argv, ['--all'|_]).
pending :-
    write('\nA TEST IS PENDING!\n'),
    fail.

:- begin_tests(two_bucket).

    test(measure_using_bucket_one_of_size_3_and_bucket_two_of_size_5_start_with_bucket_one, condition(true)) :-
        measure(3, 5, 1, one, Measurement),
        Measurement == measurement(moves(4), goalBucket(one), otherBucket(5)).

    test(measure_using_bucket_one_of_size_3_and_bucket_two_of_size_5_start_with_bucket_two, condition(pending)) :-
        measure(3, 5, 1, two, Measurement),
        Measurement == measurement(moves(8), goalBucket(two), otherBucket(3)).

    test(measure_using_bucket_one_of_size_7_and_bucket_two_of_size_11_start_with_bucket_one, condition(pending)) :-
        measure(7, 11, 2, one, Measurement),
        Measurement == measurement(moves(14), goalBucket(one), otherBucket(11)).

    test(measure_using_bucket_one_of_size_7_and_bucket_two_of_size_11_start_with_bucket_two, condition(pending)) :-
        measure(7, 11, 2, two, Measurement),
        Measurement == measurement(moves(18), goalBucket(two), otherBucket(7)).

    test(measure_one_step_using_bucket_one_of_size_1_and_bucket_two_of_size_3_start_with_bucket_two, condition(pending)) :-
        measure(1, 3, 3, two, Measurement),
        Measurement == measurement(moves(1), goalBucket(two), otherBucket(0)).

    test(measure_using_bucket_one_of_size_2_and_bucket_two_of_size_3_start_with_bucket_one_and_end_with_bucket_two, condition(pending)) :-
        measure(2, 3, 3, one, Measurement),
        Measurement == measurement(moves(2), goalBucket(two), otherBucket(2)).

    test(not_possible_to_reach_the_goal, [fail, condition(pending)]) :-
        measure(6, 15, 5, one, _).

    test(with_the_same_buckets_but_a_different_goal_then_it_is_possible, condition(pending)) :-
        measure(6, 15, 9, one, Measurement),
        Measurement == measurement(moves(10), goalBucket(two), otherBucket(0)).

    test(goal_larger_than_both_buckets_is_impossible, [fail, condition(pending)]) :-
        measure(5, 7, 8, one, _).

:- end_tests(two_bucket).
