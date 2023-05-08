possible_date(may, 15).
possible_date(may, 16). 
possible_date(may, 19).
possible_date(june, 17).
possible_date(june, 18).
possible_date(july, 14).
possible_date(july, 16).
possible_date(august, 14).
possible_date(august, 15).
possible_date(august, 17).

day_with_unique_month(Day) :-
    possible_date(Month, Day),
    findall(Day1, possible_date(Month, Day1), Days),
    length(Days, 1).

month_with_unique_day(Month):-
    possible_date(Month, Day),
    findall(Month1, possible_date(Month1, Day), Months),
    length(Months, 1).

statement_1(Month, Day):-
    possible_date(Month, Day),
    not(day_with_unique_month(Day)),
    not(month_with_unique_day(Month)).

statement_2(Month, Day):-
    possible_date(Month, Day),
    findall(Month1, statement_1(Month1, Day), [Month]).

statement_3(Month, Day):-
    possible_date(Month, Day),
    findall(Day1, statement_2(Month, Day1), [Day]).

cheryls_birthday(Month, Day) :-
    statement_1(Month, Day),
    statement_2(Month, Day),
    statement_3(Month, Day),
    !.
