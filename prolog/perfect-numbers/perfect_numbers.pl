:- use_module(library(clpfd)).

factors(1, []) :- !.
factors(Number, [1|Factors]) :-
    MaxSmallFactor is floor(sqrt(Number)),
    findall(SmallFactor, (between(2, MaxSmallFactor, SmallFactor), Number mod SmallFactor =:= 0), SmallFactors),
    findall(BigFactor, (member(Factor, SmallFactors), BigFactor is Number // Factor, BigFactor < Number, BigFactor =\= Factor), BigFactors),
    append(SmallFactors, BigFactors, FactorsUnsorted),
    sort(FactorsUnsorted, Factors).

aliquot_sum(Number, AliquotSum) :-    
    factors(Number, Factors),
    sum_list(Factors, AliquotSum).

classify(Number, AliquotSum, abundant) :- AliquotSum #> Number, !.
classify(Number, AliquotSum, deficient) :- AliquotSum #< Number, !.
classify(_, _, perfect) :- !.

classify(Number, Classification) :-
    Number #> 0,
    aliquot_sum(Number, AliquotSum),
    classify(Number, AliquotSum, Classification).
