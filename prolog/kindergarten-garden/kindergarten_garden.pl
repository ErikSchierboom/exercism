plant('C', clover).
plant('G', grass).
plant('R', radishes).
plant('V', violets).

garden(Garden, Child, [Plant1, Plant2, Plant3, Plant4]) :-
  Children = [alice, bob, charlie, david, eve, fred, ginny, harriet, ileana, joseph, kincaid, larry],
  split_string(Garden, "\n", "", [Line1, Line2]),
  string_chars(Line1, Row1), string_chars(Line2, Row2),
  nth0(Index, Children, Child),
  First is 2 * Index,
  succ(First, Second),
  nth0(First, Row1, P1), nth0(Second, Row1, P2),
  nth0(First, Row2, P3), nth0(Second, Row2, P4),
  plant(P1, Plant1), plant(P2, Plant2),
  plant(P3, Plant3), plant(P4, Plant4),
  !.
