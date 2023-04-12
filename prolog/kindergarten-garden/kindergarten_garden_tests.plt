pending :-
  current_prolog_flag(argv, ['--all'|_]).
pending :-
  write('\nA TEST IS PENDING!\n'),
  fail.

:- begin_tests(partial_garden).

  test(garden_with_single_student, condition(true)) :-
    garden("RC\nGG", alice, Plants),
    Plants == [radishes, clover, grass, grass].

  test(different_garden_with_single_student, condition(pending)) :-
    garden("VC\nRC", alice, Plants),
    Plants == [violets, clover, radishes, clover].

  test(garden_with_two_students, condition(pending)) :-
    garden("VVCG\nVVRC", bob, Plants),
    Plants == [clover, grass, radishes, clover].

  test(multiple_students_for_the_same_garden_with_three_students, condition(pending)) :-
    garden("VVCCGG\nVVCCGG", bob, Plants),
    Plants == [clover, clover, clover, clover].

  test(third_student_garden, condition(pending)) :-
    garden("VVCCGG\nVVCCGG", charlie, Plants),
    Plants == [grass, grass, grass, grass].

:- end_tests(partial_garden).

:- begin_tests(full_garden).

  test(for_alice_first_student_garden, condition(pending)) :-
    garden("VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV", alice, Plants),
    Plants == [violets, radishes, violets, radishes].

  test(for_bob_second_student_garden, condition(pending)) :-
    garden("VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV", bob, Plants),
    Plants == [clover, grass, clover, clover].
  
  test(for_charlie, condition(pending)) :-
    garden("VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV", charlie, Plants),
    Plants == [violets, violets, clover, grass].
  
  test(for_david, condition(pending)) :-
    garden("VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV", david, Plants),
    Plants == [radishes, violets, clover, radishes].

  test(for_eve, condition(pending)) :-
    garden("VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV", eve, Plants),
    Plants == [clover, grass, radishes, grass].

  test(for_fred, condition(pending)) :-
    garden("VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV", fred, Plants),
    Plants == [grass, clover, violets, clover].

  test(for_ginny, condition(pending)) :-
    garden("VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV", ginny, Plants),
    Plants == [clover, grass, grass, clover].

  test(for_harriet, condition(pending)) :-
    garden("VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV", harriet, Plants),
    Plants == [violets, radishes, radishes, violets].

  test(for_ileana, condition(pending)) :-
    garden("VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV", ileana, Plants),
    Plants == [grass, clover, violets, clover].

  test(for_joseph, condition(pending)) :-
    garden("VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV", joseph, Plants),
    Plants == [violets, clover, violets, grass].

  test(for_kincaid_second_to_last_student_garden, condition(pending)) :-
    garden("VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV", kincaid, Plants),
    Plants == [grass, clover, clover, grass].

  test(for_larry_last_student_garden, condition(pending)) :-
    garden("VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV", larry, Plants),
    Plants == [grass, violets, clover, violets].

:- end_tests(full_garden).