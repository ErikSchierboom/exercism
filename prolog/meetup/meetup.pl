:- use_module(library(date_time)).
:- use_module(library(clpfd)).

days_helper(Month, Date, WeekDay, Dates) :-
    date_extract(Date, months(Month)),
    date_add(Date, 1 days, NextDay),
    days_helper(Month, NextDay, WeekDay, NextDates),
    (week_day(Date, WeekDay) -> Dates = [Date|NextDates]; Dates = NextDates), !.

days_helper(_, _, _, []).

days(Year, Month, WeekDay, Dates) :-
    date_create(Year, Month, 1, Date),
    days_helper(Month, Date, WeekDay, Dates).

nth1_day(Year, Month, WeekDay, Index, Date) :-
    days(Year, Month, WeekDay, Dates),
    nth1(Index, Dates, Date).

meetup(Year, Month, first, WeekDay, Date)  :- nth1_day(Year, Month, WeekDay, 1, Date), !.
meetup(Year, Month, second, WeekDay, Date) :- nth1_day(Year, Month, WeekDay, 2, Date), !.
meetup(Year, Month, third, WeekDay, Date)  :- nth1_day(Year, Month, WeekDay, 3, Date), !.
meetup(Year, Month, fourth, WeekDay, Date) :- nth1_day(Year, Month, WeekDay, 4, Date), !.

meetup(Year, Month, last, WeekDay, Date) :-
    days(Year, Month, WeekDay, Dates),
    last(Dates, Date), !.

meetup(Year, Month, teenth, WeekDay, Date) :-
    days(Year, Month, WeekDay, Dates),
    member(Date, Dates), 
    date_extract(Date, days(Day)),
    Day #>= 13,
    !.
