const allergenMasks = {
    'eggs': 1,
    'peanuts': 2,
    'shellfish': 4,
    'strawberries': 8,
    'tomatoes': 16,
    'chocolate': 32,
    'pollen': 64,
    'cats': 128
};

export default class Allergies {
    constructor(allergies) {
        this.allergies = allergies;
    }

    list() {
        return Object.keys(allergenMasks).filter(allergen => this.allergicTo(allergen));
    }

    allergicTo(allergen) {
        return (this.allergies & allergenMasks[allergen]) !== 0;
    }
}