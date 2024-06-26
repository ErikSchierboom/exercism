const COLORS = ["Red", "Green", "Ivory", "Yellow", "Blue"];
const RESIDENTS = [
  "Englishman",
  "Spaniard",
  "Ukrainian",
  "Norwegian",
  "Japanese",
];
const PETS = ["Dog", "Snails", "Fox", "Horse", "Zebra"];
const DRINKS = ["Coffee", "Tea", "Milk", "OrangeJuice", "Water"];
const SMOKES = [
  "OldGold",
  "Kools",
  "Chesterfields",
  "LuckyStrike",
  "Parliaments",
];

export class ZebraPuzzle {
  constructor() {
    this.solution = this.solve();
  }

  waterDrinker() {
    return this.solution.residents[this.solution.drinks.indexOf("Water")];
  }

  zebraOwner() {
    return this.solution.residents[this.solution.pets.indexOf("Zebra")];
  }

  solve() {
    for (const colors of permutations(COLORS)) {
      if (this.matchesColorRules(colors)) {
        for (const residents of permutations(RESIDENTS)) {
          if (this.matchesResidentRules(colors, residents)) {
            for (const pets of permutations(PETS)) {
              if (this.matchesPetRules(residents, pets)) {
                for (const drinks of permutations(DRINKS)) {
                  if (this.matchesDrinkRules(colors, residents, drinks)) {
                    for (const smokes of permutations(SMOKES)) {
                      if (
                        this.matchesSmokeRules(
                          colors,
                          residents,
                          drinks,
                          pets,
                          smokes
                        )
                      ) {
                        return { colors, residents, pets, drinks, smokes };
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }

    throw new Error("No solution found");
  }

  matchesColorRules(colors) {
    return colors.indexOf("Green") === colors.indexOf("Ivory") + 1;
  }

  matchesResidentRules(colors, residents) {
    return (
      residents.indexOf("Norwegian") === 0 &&
      residents.indexOf("Englishman") === colors.indexOf("Red") &&
      Math.abs(residents.indexOf("Norwegian") - colors.indexOf("Blue")) === 1
    );
  }

  matchesPetRules(residents, pets) {
    return pets.indexOf("Dog") === residents.indexOf("Spaniard");
  }

  matchesDrinkRules(colors, residents, drinks) {
    return (
      drinks.indexOf("Coffee") === colors.indexOf("Green") &&
      drinks.indexOf("Tea") === residents.indexOf("Ukrainian") &&
      drinks.indexOf("Milk") === 2
    );
  }

  matchesSmokeRules(colors, residents, drinks, pets, smokes) {
    return (
      smokes.indexOf("OldGold") === pets.indexOf("Snails") &&
      smokes.indexOf("Kools") === colors.indexOf("Yellow") &&
      Math.abs(smokes.indexOf("Chesterfields") - pets.indexOf("Fox")) === 1 &&
      Math.abs(smokes.indexOf("Kools") - pets.indexOf("Horse")) === 1 &&
      smokes.indexOf("LuckyStrike") === drinks.indexOf("OrangeJuice") &&
      smokes.indexOf("Parliaments") === residents.indexOf("Japanese")
    );
  }
}

function permutations(xs) {
  if (xs.length <= 1) return [xs];

  const result = [];

  for (const [index, item] of xs.entries()) {
    const remainingItems = [...xs.slice(0, index), ...xs.slice(index + 1)];
    const remainingPermutations = permutations(remainingItems);

    for (const permutation of remainingPermutations)
      result.push([item, ...permutation]);
  }

  return result;
}
