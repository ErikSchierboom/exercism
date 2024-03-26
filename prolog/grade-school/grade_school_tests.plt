pending :-
    current_prolog_flag(argv, ['--all'|_]).
pending :-
    write('\nA TEST IS PENDING!\n'),
    fail.

:- begin_tests(grade_school).

    test(roster_is_empty_when_no_student_is_added, condition(true)) :-
        create_school(School),
        roster(School, Roster),
        Roster == [].

    test(student_is_added_to_the_roster, condition(pending)) :-
        create_school(School),
        add_student(School, "Aimee", 2, School1),
        roster(School1, Roster),
        Roster == ["Aimee"].

    test(multiple_students_in_the_same_grade_are_added_to_the_roster, condition(pending)) :-
        create_school(School),
        add_student(School, "Blair", 2, School1),
        add_student(School1, "James", 2, School2),
        add_student(School2, "Paul", 2, School3),
        roster(School3, Roster), 
        Roster == ["Blair", "James", "Paul"].

    test(cannot_add_student_to_same_grade_in_the_roster_more_than_once, [fail, condition(pending)]) :-
        create_school(School),
        add_student(School, "Blair", 2, School1),
        add_student(School1, "James", 2, School2),
        add_student(School2, "James", 2, _).

    test(students_in_multiple_grades_are_added_to_the_roster, condition(pending)) :-
        create_school(School),
        add_student(School, "Chelsea", 3, School1),
        add_student(School1, "Logan", 7, School2),
        roster(School2, Roster),
        Roster == ["Chelsea", "Logan"].

    test(cannot_add_same_student_to_multiple_grades_in_the_roster, [fail, condition(pending)]) :-
        create_school(School),
        add_student(School, "Blair", 2, School1),
        add_student(School1, "James", 2, School2),
        add_student(School2, "James", 3, _).

    test(students_are_sorted_by_grades_in_the_roster, condition(pending)) :-
        create_school(School),
        add_student(School, "Jim", 3, School1),
        add_student(School1, "Peter", 2, School2),
        add_student(School2, "Anna", 1, School3),
        roster(School3, Roster),
        Roster == ["Anna", "Peter", "Jim"].

    test(students_are_sorted_by_name_in_the_roster, condition(pending)) :-
        create_school(School),
        add_student(School, "Peter", 2, School1),
        add_student(School1, "Zoe", 2, School2),
        add_student(School2, "Alex", 2, School3),
        roster(School3, Roster),
        Roster == ["Alex", "Peter", "Zoe"].

    test(students_are_sorted_by_grades_and_then_by_name_in_the_roster, condition(pending)) :-
        create_school(School),
        add_student(School, "Peter", 2, School1),
        add_student(School1, "Anna", 1, School2),
        add_student(School2, "Barb", 1, School3),
        add_student(School3, "Zoe", 2, School4),
        add_student(School4, "Alex", 2, School5),
        add_student(School5, "Jim", 3, School6),
        add_student(School6, "Charlie", 1, School7),
        roster(School7, Roster),
        Roster == ["Anna", "Barb", "Charlie", "Alex", "Peter", "Zoe", "Jim"].

    test(grade_is_empty_if_no_students_in_the_roster, condition(pending)) :-
        create_school(School),
        grade(School, 1, Grade),
        Grade == [].

    test(grade_is_empty_if_no_students_in_that_grade, condition(pending)) :-
        create_school(School),
        add_student(School, "Peter", 2, School1),
        add_student(School1, "Zoe", 2, School2),
        add_student(School2, "Alex", 2, School3),
        add_student(School3, "Jim", 3, School4),    
        grade(School4, 1, Grade),
        Grade == [].

    test(students_are_sorted_by_name_in_a_grade, condition(pending)) :-
        create_school(School),
        add_student(School, "Franklin", 5, School1),
        add_student(School1, "Bradley", 5, School2),
        add_student(School2, "Jeff", 1, School3),
        grade(School3, 5, Grade),
        Grade == ["Bradley", "Franklin"].

:- end_tests(grade_school).
