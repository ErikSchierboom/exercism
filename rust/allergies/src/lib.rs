pub struct Allergies {
    score: u32
}

#[derive(Copy, Clone, Debug, PartialEq, Eq)]
pub enum Allergen {
    Eggs         = 1 << 0,
    Peanuts      = 1 << 1,
    Shellfish    = 1 << 2,
    Strawberries = 1 << 3,
    Tomatoes     = 1 << 4,
    Chocolate    = 1 << 5,
    Pollen       = 1 << 6,
    Cats         = 1 << 7,
}

const ALLERGENS: [Allergen; 8] = [
    Allergen::Eggs,
    Allergen::Peanuts,
    Allergen::Shellfish,
    Allergen::Strawberries,
    Allergen::Tomatoes,
    Allergen::Chocolate,
    Allergen::Pollen,
    Allergen::Cats
];

impl Allergen {
    pub fn value(self) -> u32 {
        self as u32
    }
}

impl Allergies {
    pub fn new(score: u32) -> Self {
        Allergies { score }
    }

    pub fn is_allergic_to(&self, allergen: &Allergen) -> bool {
        self.score & allergen.value() != 0
    }

    pub fn allergies(&self) -> Vec<Allergen> {
        ALLERGENS.into_iter()
            .filter(|allergen| self.is_allergic_to(allergen))
            .collect()
    }
}
