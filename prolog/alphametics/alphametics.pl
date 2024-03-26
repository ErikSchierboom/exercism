:- use_module(library(dcg/basics)).
:- use_module(library(clpfd)).
:- set_prolog_flag(double_quotes, chars).

letter(Letter) --> [Letter], { char_type(Letter, upper) }.
operand([Letter|Letters]) --> letter(Letter), operand(Letters).
operand([Letter]) --> letter(Letter).

operands([Operand|Operands]) --> operand(Operand), " + ", operands(Operands).
operands([Operand]) --> operand(Operand).

equation(Left, Right) --> operands(Left), " == ", operands(Right).

letter_map(Sign, Letters, Mapping) :- 
    reverse(Letters, ReversedLetters),
    findall(L-C, (nth0(I, ReversedLetters, L), C is Sign * 10 ^ I), Mapping).

map_merge(Mappings, Mapping) :-
    setof(Key, Value^member(Key-Value, Mappings), Keys),
    findall(Key-Sum, (member(Key, Keys), aggregate(sum(Value), member(Key-Value, Mappings), Sum)), Mapping).

mapping(Left, Right, Mapping) :-
    maplist(letter_map(1), Left, LeftMappings),
    maplist(letter_map(-1), Right, RightMappings),
    append(LeftMappings, RightMappings, NestedMappings),
    flatten(NestedMappings, Mappings),
    map_merge(Mappings, Mapping).

zero_letters(Left, Right, ZeroLetters) :-
    append(Left, Right, LeftAndRight),
    findall(ZeroChar, member([ZeroChar|_], LeftAndRight), ALlZeroLetters),
    sort(ALlZeroLetters, ZeroLetters).

parse(Equation, Mapping, Letters, ZeroLetters) :-
    string_chars(Equation, Chars),
    phrase(equation(Left, Right), Chars),
    mapping(Left, Right, Mapping),
    zero_letters(Left, Right, ZeroLetters),
    pairs_keys(Mapping, Letters).    

add_range(ZeroLetters, Letter, Digit) :-
    (member(Letter, ZeroLetters) -> Min = 1; Min = 0),
    Digit in Min..9.

solve(Equation, Solution) :-
    parse(Equation, Mapping, Letters, ZeroLetters),
    length(Letters, Count),
    length(Digits, Count),
    all_different(Digits),
    maplist(add_range(ZeroLetters), Letters, Digits),
    pairs_values(Mapping, Multipliers),
    scalar_product(Multipliers, Digits, #=, 0),
    pairs_keys_values(Solution, Letters, Digits),
    label(Digits),
    !.
