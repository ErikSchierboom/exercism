import bitops, tables, sequtils

const Allergens = 
  {
    "eggs":         0,
    "peanuts":      1,
    "shellfish":    2,
    "strawberries": 3,
    "tomatoes":     4,
    "chocolate":    5,
    "pollen":       6,
    "cats":         7
  }.toOrderedTable

type
  Allergies* = object
    score*: int

proc isAllergicTo*(allergies: Allergies, allergen: string): bool =
  testBit(allergies.score, Allergens[allergen])

proc lst*(allergies: Allergies): seq[string] =
  toSeq(Allergens.keys).filterIt(allergies.isAllergicTo(it))
