:- use_module(library(clpfd)).

dimensions([], 0, 0, 0) :- !.
dimensions(Chars, Columns, Rows, PadLength) :-
    length(Chars, Length),
    Columns is ceiling(sqrt(Length)),
    Rows is ceiling(Length / Columns),
    PadLength is Rows * Columns - Length.

normalize(Plaintext, Normalized) :-
    string_lower(Plaintext, Lower),
    string_chars(Lower, Chars),
    include([C]>>char_type(C, alnum), Chars, Normalized).

part([], _, []).
part(L, N, [DL|DLTail]) :-
   length(DL, N),
   append(DL, LTail, L),
   part(LTail, N, DLTail).

join(Row, "", Combined) :- string_chars(Combined, Row), !.
join(Row, Acc, Combined) :- 
    string_chars(String, Row),
    format(string(Combined), "~s ~s", [Acc, String]).

encode(Plaintext, Ciphertext) :-
    normalize(Plaintext, Normalized),
    dimensions(Normalized, Columns, Rows, PadLength),
    length(Padding, PadLength),
    maplist(=(' '), Padding),
    append(Normalized, Padding, NormalizedAndPadded),
    part(NormalizedAndPadded, Columns, Chunked),
    transpose(Chunked, Transposed),
    flatten(Transposed, Flattened),
    part(Flattened, Rows, Parts),
    foldl(join, Parts, "", Ciphertext),
    !.
