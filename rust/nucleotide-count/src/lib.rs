use std::collections::HashMap;

const NUCLEOTIDES: [char; 4] = ['G', 'T', 'C', 'A'];

pub fn count(nucleotide: char, dna: &str) -> Result<usize, char> {
    let counts = nucleotide_counts(dna)?;
    counts.get(&nucleotide).ok_or(nucleotide).cloned()
}

pub fn nucleotide_counts(dna: &str) -> Result<HashMap<char, usize>, char> {
    let mut counts: HashMap<char, usize> = NUCLEOTIDES.iter().map(|n| (*n, 0)).collect();

    for c in dna.chars() {
        let count = counts.get_mut(&c).ok_or(c)?;
        *count += 1
    }

    Ok(counts)
}
