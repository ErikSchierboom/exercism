use std::collections::HashMap;

#[derive(Debug, PartialEq, Eq)]
pub struct Dna {
    nucleotides: String
}

#[derive(Debug, PartialEq, Eq)]
pub struct Rna {
    nucleotides: String
}

fn translate(input: &str, mapping: &HashMap<char, char>) -> Result<String, usize> {
    input
        .chars()
        .enumerate()
        .map(|(idx, c)| mapping.get(&c).ok_or(idx))
        .collect::<Result<String, usize>>()
}

impl Dna {
    pub fn new(dna: &str) -> Result<Dna, usize> {
        let mapping: HashMap<char, char> = [('G', 'C'), ('C', 'G'), ('T', 'A'), ('A', 'U')].into_iter().collect();
        translate(dna, &mapping).map(|nucleotides| Dna { nucleotides })
    }

    pub fn into_rna(self) -> Rna {
        Rna::new(self.nucleotides.as_str()).unwrap()
    }
}

impl Rna {
    pub fn new(rna: &str) -> Result<Rna, usize> {
        let mapping: HashMap<char, char> = [('C', 'G'), ('G', 'C'), ('A', 'T'), ('U', 'A')].into_iter().collect();
        translate(rna, &mapping).map(|nucleotides| Rna { nucleotides })
    }
}
