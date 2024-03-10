pending :-
    current_prolog_flag(argv, ['--all'|_]).
pending :-
    write('\nA TEST IS PENDING!\n'),
    fail.

:- begin_tests(protein_translation).

    test(methionine_rna_sequence, condition(true)) :-
        translate("AUG", Proteins),
        Proteins == ["Methionine"].

    test(phenylalanine_rna_sequence_1, condition(true)) :-
        translate("UUU", Proteins),
        Proteins == ["Phenylalanine"].

    test(phenylalanine_rna_sequence_2, condition(true)) :-
        translate("UUC", Proteins),
        Proteins == ["Phenylalanine"].

    test(leucine_rna_sequence_1, condition(true)) :-
        translate("UUA", Proteins),
        Proteins == ["Leucine"].

    test(leucine_rna_sequence_2, condition(true)) :-
        translate("UUG", Proteins),
        Proteins == ["Leucine"].

    test(serine_rna_sequence_1, condition(true)) :-
        translate("UCU", Proteins),
        Proteins == ["Serine"].

    test(serine_rna_sequence_2, condition(true)) :-
        translate("UCC", Proteins),
        Proteins == ["Serine"].

    test(serine_rna_sequence_3, condition(true)) :-
        translate("UCA", Proteins),
        Proteins == ["Serine"].

    test(serine_rna_sequence_4, condition(true)) :-
        translate("UCG", Proteins),
        Proteins == ["Serine"].

    test(tyrosine_rna_sequence_1, condition(true)) :-
        translate("UAU", Proteins),
        Proteins == ["Tyrosine"].

    test(tyrosine_rna_sequence_2, condition(true)) :-
        translate("UAC", Proteins),
        Proteins == ["Tyrosine"].

    test(cysteine_rna_sequence_1, condition(true)) :-
        translate("UGU", Proteins),
        Proteins == ["Cysteine"].

    test(cysteine_rna_sequence_2, condition(true)) :-
        translate("UGC", Proteins),
        Proteins == ["Cysteine"].

    test(tryptophan_rna_sequence, condition(true)) :-
        translate("UGG", Proteins),
        Proteins == ["Tryptophan"].

    test(stop_codon_rna_sequence_1, condition(true)) :-
        translate("UAA", Proteins),
        Proteins == [].

    test(stop_codon_rna_sequence_2, condition(true)) :-
        translate("UAG", Proteins),
        Proteins == [].

    test(stop_codon_rna_sequence_3, condition(true)) :-
        translate("UGA", Proteins),
        Proteins == [].

    test(sequence_of_two_protein_codons_translates_into_proteins, condition(true)) :-
        translate("UUUUUU", Proteins),
        Proteins == ["Phenylalanine", "Phenylalanine"].

    test(sequence_of_two_different_protein_codons_translates_into_proteins, condition(true)) :-
        translate("UUAUUG", Proteins),
        Proteins == ["Leucine", "Leucine"].

    test(translate_rna_strand_into_correct_protein_list, condition(true)) :-
        translate("AUGUUUUGG", Proteins),
        Proteins == ["Methionine", "Phenylalanine", "Tryptophan"].

    test(translation_stops_if_stop_codon_at_beginning_of_sequence, condition(true)) :-
        translate("UAGUGG", Proteins),
        Proteins == [].

    test(translation_stops_if_stop_codon_at_end_of_two_codon_sequence, condition(true)) :-
        translate("UGGUAG", Proteins),
        Proteins == ["Tryptophan"].

    test(translation_stops_if_stop_codon_at_end_of_three_codon_sequence, condition(true)) :-
        translate("AUGUUUUAA", Proteins),
        Proteins == ["Methionine", "Phenylalanine"].

    test(translation_stops_if_stop_codon_in_middle_of_three_codon_sequence, condition(true)) :-
        translate("UGGUAGUGG", Proteins),
        Proteins == ["Tryptophan"].

    test(translation_stops_if_stop_codon_in_middle_of_six_codon_sequence, condition(true)) :-
        translate("UGGUGUUAUUAAUGGUUU", Proteins),
        Proteins == ["Tryptophan", "Cysteine", "Tyrosine"].

:- end_tests(protein_translation).
