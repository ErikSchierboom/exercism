use std::collections::HashMap;

pub struct CodonsInfo<'a> {
    codons: HashMap<&'a str, &'a str>
}

impl<'a> CodonsInfo<'a> {
    pub fn name_for(&self, codon: &str) -> Option<&'a str> {
        self.codons.get(&codon).cloned()
    }

    pub fn of_rna(&self, rna: &str) -> Option<Vec<&'a str>> {
        rna.chars()
            .collect::<Vec<char>>()
            .chunks(3)
            .map(|codon| self.name_for(&codon.iter().collect::<String>()))
            .take_while(|protein| protein.is_none() || protein.unwrap() != "stop codon")
            .collect()
    }
}

pub fn parse<'a>(pairs: Vec<(&'a str, &'a str)>) -> CodonsInfo<'a> {
    CodonsInfo { codons: pairs.into_iter().collect() }
}
