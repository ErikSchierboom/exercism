from itertools import permutations

COLORS = ["Red", "Green", "Ivory", "Yellow", "Blue"]
RESIDENTS = ["Englishman", "Spaniard", "Ukrainian", "Norwegian", "Japanese"]
PETS = ["Dog", "Snails", "Fox", "Horse", "Zebra"]
DRINKS = ["Coffee", "Tea", "Milk", "OrangeJuice", "Water"]
SMOKES = ["OldGold", "Kools", "Chesterfields", "LuckyStrike", "Parliaments"]


def solve():
    for colors in permutations(COLORS):
        if matches_color_rules(colors):
            for residents in permutations(RESIDENTS):
                if matches_resident_rules(colors, residents):
                    for pets in permutations(PETS):
                        if matches_pet_rules(residents, pets):
                            for drinks in permutations(DRINKS):
                                if matches_drink_rules(colors, residents, drinks):
                                    for smokes in permutations(SMOKES):
                                        if matches_smoke_rules(colors, residents, drinks, pets, smokes):
                                            return {"colors": colors, "residents": residents, "pets": pets,
                                                    "drinks": drinks, "smokes": smokes}

    raise ValueError("No solution found")


def matches_color_rules(colors):
    return colors.index("Green") == colors.index("Ivory") + 1


def matches_resident_rules(colors, residents):
    return (
            residents.index("Norwegian") == 0 and
            residents.index("Englishman") == colors.index("Red") and
            abs(residents.index("Norwegian") - colors.index("Blue")) == 1
    )


def matches_pet_rules(residents, pets):
    return pets.index("Dog") == residents.index("Spaniard")


def matches_drink_rules(colors, residents, drinks):
    return (
            drinks.index("Coffee") == colors.index("Green") and
            drinks.index("Tea") == residents.index("Ukrainian") and
            drinks.index("Milk") == 2
    )


def matches_smoke_rules(colors, residents, drinks, pets, smokes):
    return (
            smokes.index("OldGold") == pets.index("Snails") and
            smokes.index("Kools") == colors.index("Yellow") and
            abs(smokes.index("Chesterfields") - pets.index("Fox")) == 1 and
            abs(smokes.index("Kools") - pets.index("Horse")) == 1 and
            smokes.index("LuckyStrike") == drinks.index("OrangeJuice") and
            smokes.index("Parliaments") == residents.index("Japanese")
    )


solution = solve()


def drinks_water():
    return solution["residents"][solution["drinks"].index("Water")]


def owns_zebra():
    return solution["residents"][solution["pets"].index("Zebra")]
