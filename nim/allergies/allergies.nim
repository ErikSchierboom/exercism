import tables
import sequtils

const Allergens = 
  {
    "eggs":         0b00000001,
    "peanuts":      0b00000010,
    "shellfish":    0b00000100,
    "strawberries": 0b00001000,
    "tomatoes":     0b00010000,
    "chocolate":    0b00100000,
    "pollen":       0b01000000,
    "cats":         0b10000000
  }.toOrderedTable

type
  Allergies* = object
    score*: int

proc isAllergicTo*(allergies: Allergies, allergen: string): bool =
  allergies.score.and(Allergens[allergen]) != 0

proc lst*(allergies: Allergies): seq[string] =
  toSeq(Allergens.keys).filterIt(allergies.isAllergicTo(it))
