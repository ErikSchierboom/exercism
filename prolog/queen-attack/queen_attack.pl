create((Row, Col)) :- between(0, 7, Row), between(0, 7, Col).

attack((Row, _), (Row, _)) :- !.
attack((_, Col), (_, Col)) :- !.
attack((Row1, Col1), (Row2, Col2)):- abs(Row1 - Row2) =:= abs(Col1 - Col2).
