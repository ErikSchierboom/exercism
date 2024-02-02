module ProteinTranslation

let proteins (rna: string): string list =
    let doProteins (rna: string): (string * string) option =
        match rna[0..2] with
        | "AUG" ->                         Some ("Methionine",    rna[3..])
        | "UGG" ->                         Some ("Tryptophan",    rna[3..])        
        | "UUC" | "UUU" ->                 Some ("Phenylalanine", rna[3..])
        | "UUA" | "UUG" ->                 Some ("Leucine",       rna[3..])
        | "UAU" | "UAC" ->                 Some ("Tyrosine",      rna[3..])
        | "UGU" | "UGC" ->                 Some ("Cysteine",      rna[3..])
        | "UCU" | "UCC" | "UCA" | "UCG" -> Some ("Serine",        rna[3..])
        | "UAA" | "UAG" | "UGA" | "" ->    None
        | _ -> failwith "Unknown coding"

    List.unfold doProteins rna