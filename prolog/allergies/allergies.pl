allergic_to(Score, Allergen) :- 
    score(Allergen, AllergenScore),
    Score /\ AllergenScore =:= AllergenScore.

allergies(Score, Allergies) :-
    findall(Allergen, allergic_to(Score, Allergen), Allergies).

score(eggs, 1).
score(peanuts, 2).
score(shellfish, 4).
score(strawberries, 8).
score(tomatoes, 16).
score(chocolate, 32).
score(pollen, 64).
score(cats, 128).
