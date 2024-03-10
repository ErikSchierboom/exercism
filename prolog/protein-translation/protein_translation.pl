:- use_module(library(dcg/basics)).

protein_sequence([]) --> [].
protein_sequence([]) --> stop, remainder(_).
protein_sequence([Protein|Proteins]) --> protein(Protein), protein_sequence(Proteins).

protein("Methionine") --> "AUG".
protein("Phenylalanine") --> "UUU" | "UUC".
protein("Leucine") --> "UUA" | "UUG".
protein("Serine") --> "UCU" | "UCC" | "UCA" | "UCG".
protein("Tyrosine") --> "UAU" | "UAC".
protein("Cysteine") --> "UGU" | "UGC".
protein("Tryptophan") --> "UGG".

stop --> "UAA" | "UAG" | "UGA".

translate(Rna, Proteins) :-
    string_codes(Rna, RnaCodes),
    phrase(protein_sequence(Proteins), RnaCodes), !.
