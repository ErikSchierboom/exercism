create_school([]).

roster(School, Students) :-
    sort(School, SortedSchool),
    pairs_values(SortedSchool, Students).

add_student(School, Student, Grade, [Grade-Student|School]) :-
    \+ member(_-Student, School).

grade(School, Grade, Students) :-
    include([Grade-_]>>true, School, Pairs),
    pairs_values(Pairs, UnsortedStudents),
    sort(UnsortedStudents, Students).
