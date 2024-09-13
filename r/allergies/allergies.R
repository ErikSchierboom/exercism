allergen_scores = c(eggs = 1, peanuts = 2, shellfish = 4, strawberries = 8, 
                    tomatoes = 16, chocolate = 32, pollen = 64, cats = 128)

allergy <- function(num) {
  num
}

allergic_to <- function(allergy_object, allergy) {
  bitwAnd(allergy_object, allergen_scores[[allergy]]) != 0
}

list_allergies <- function(allergy_object) {
  allergens = names(allergen_scores)
  allergens[sapply(allergens, allergic_to, allergy_object = allergy_object)]
}
