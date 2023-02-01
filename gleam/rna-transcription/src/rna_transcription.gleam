import gleam/string.{pop_grapheme}

pub fn to_rna(dna: String) -> Result(String, Nil) {
  do_to_rna(dna, "")
}

fn do_to_rna(dna: String, rna: String) -> Result(String, Nil) {
  case pop_grapheme(dna) {
    Ok(#("G", tail)) -> do_to_rna(tail, rna <> "C")
    Ok(#("C", tail)) -> do_to_rna(tail, rna <> "G")
    Ok(#("T", tail)) -> do_to_rna(tail, rna <> "A")
    Ok(#("A", tail)) -> do_to_rna(tail, rna <> "U")
    Ok(_) -> Error(Nil)
    Error(Nil) -> Ok(rna)
  }
}
