pending :-
    current_prolog_flag(argv, ['--all'|_]).
pending :-
    write('\nA TEST IS PENDING!\n'),
    fail.

:- begin_tests(roman_numerals).

test(number_1_is_i, condition(true)) :-
    convert(1, Numeral),
    Numeral == "I".

test(number_2_is_ii, condition(true)) :-
    convert(2, Numeral),
    Numeral == "II".

test(number_3_is_iii, condition(true)) :-
    convert(3, Numeral),
    Numeral == "III".

test(number_4_is_iv, condition(true)) :-
    convert(4, Numeral),
    Numeral == "IV".

test(number_5_is_v, condition(true)) :-
    convert(5, Numeral),
    Numeral == "V".

test(number_6_is_vi, condition(true)) :-
    convert(6, Numeral),
    Numeral == "VI".

test(number_9_is_ix, condition(true)) :-
    convert(9, Numeral),
    Numeral == "IX".

test(number_16_is_xvi, condition(true)) :-
    convert(16, Numeral),
    Numeral == "XVI".

test(number_27_is_xxvii, condition(true)) :-
    convert(27, Numeral),
    Numeral == "XXVII".

test(number_48_is_xlviii, condition(true)) :-
    convert(48, Numeral),
    Numeral == "XLVIII".

test(number_49_is_xlix, condition(true)) :-
    convert(49, Numeral),
    Numeral == "XLIX".

test(number_59_is_lix, condition(true)) :-
    convert(59, Numeral),
    Numeral == "LIX".

test(number_66_is_lxvi, condition(true)) :-
    convert(66, Numeral),
    Numeral == "LXVI".

test(number_93_is_xciii, condition(true)) :-
    convert(93, Numeral),
    Numeral == "XCIII".

test(number_141_is_cxli, condition(true)) :-
    convert(141, Numeral),
    Numeral == "CXLI".

test(number_163_is_clxiii, condition(true)) :-
    convert(163, Numeral),
    Numeral == "CLXIII".

test(number_166_is_clxvi, condition(true)) :-
    convert(166, Numeral),
    Numeral == "CLXVI".

test(number_402_is_cdii, condition(true)) :-
    convert(402, Numeral),
    Numeral == "CDII".

test(number_575_is_dlxxv, condition(true)) :-
    convert(575, Numeral),
    Numeral == "DLXXV".

test(number_666_is_dclxvi, condition(true)) :-
    convert(666, Numeral),
    Numeral == "DCLXVI".

test(number_911_is_cmxi, condition(true)) :-
    convert(911, Numeral),
    Numeral == "CMXI".

test(number_1024_is_mxxiv, condition(true)) :-
    convert(1024, Numeral),
    Numeral == "MXXIV".

test(number_1666_is_mdclxvi, condition(true)) :-
    convert(1666, Numeral),
    Numeral == "MDCLXVI".

test(number_3000_is_mmm, condition(true)) :-
    convert(3000, Numeral),
    Numeral == "MMM".

test(number_3001_is_mmmi, condition(true)) :-
    convert(3001, Numeral),
    Numeral == "MMMI".

test(number_3999_is_mmmcmxcix, condition(true)) :-
    convert(3999, Numeral),
    Numeral == "MMMCMXCIX".

:- end_tests(roman_numerals).
