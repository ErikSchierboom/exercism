module ProteinTranslation

let private codonToProtein = 
    function
    | "AUG" -> "Methionine"
    | "UGG" -> "Tryptophan"
    | "UUC" | "UUU" -> "Phenylalanine"
    | "UUA" | "UUG" -> "Leucine"    
    | "UAU" | "UAC" -> "Tyrosine"
    | "UGU" | "UGC" -> "Cysteine"    
    | "UCU" | "UCC" | "UCA" | "UCG" -> "Serine"
    | "UAA" | "UAG" | "UGA" -> "STOP"    
    | _ -> failwith "Invalid codon"

let proteins (input: string) =
    input 
    |> Seq.chunkBySize 3 
    |> Seq.map (System.String >> codonToProtein)
    |> Seq.takeWhile (fun str -> str <> "STOP")
    |> Seq.toList