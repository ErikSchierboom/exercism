import gleam/result.{map}
import gleam/list.{try_map}
import gleam/string.{concat, to_graphemes}

pub fn to_rna(dna: String) -> Result(String, Nil) {
  dna
  |> to_graphemes
  |> try_map(complement)
  |> map(concat)
}

fn complement(nucleotide: String) -> Result(String, Nil) {
  case nucleotide {
    "G" -> Ok("C")
    "C" -> Ok("G")
    "T" -> Ok("A")
    "A" -> Ok("U")
    _ -> Error(Nil)
  }
}
