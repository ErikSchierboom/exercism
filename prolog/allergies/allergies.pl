:- use_module(library(clpfd)).

allergens([eggs, peanuts, shellfish, strawberries, tomatoes, chocolate, pollen, cats]).

allergic_to(Score, eggs)         :- getbit(Score, 0) =:= 1.
allergic_to(Score, peanuts)      :- getbit(Score, 1) =:= 1.
allergic_to(Score, shellfish)    :- getbit(Score, 2) =:= 1.
allergic_to(Score, strawberries) :- getbit(Score, 3) =:= 1.
allergic_to(Score, tomatoes)     :- getbit(Score, 4) =:= 1.
allergic_to(Score, chocolate)    :- getbit(Score, 5) =:= 1.
allergic_to(Score, pollen)       :- getbit(Score, 6) =:= 1.
allergic_to(Score, cats)         :- getbit(Score, 7) =:= 1.

allergies(Score, Allergies) :- findall(Allergen, allergic_to(Score, Allergen), Allergies).
