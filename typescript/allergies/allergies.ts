const allergenMasks: { [allergen: string]: number; } = {
    eggs: 1,
    peanuts: 2,
    shellfish: 4,
    strawberries: 8,
    tomatoes: 16,
    chocolate: 32,
    pollen: 64,
    cats: 128
}

export default class Allergies {
    private allergies: number

    constructor(allergies: number) {
        this.allergies = allergies
    }

    list(): string[] {
        return Object.keys(allergenMasks).filter((allergen) => this.allergicTo(allergen))
    }

    allergicTo(allergen: string): boolean {
        return (this.allergies & allergenMasks[allergen]) !== 0
    }
}