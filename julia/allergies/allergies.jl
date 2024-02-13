const ALLERGENS = Dict(
    "eggs" => 1, "peanuts" => 2, "shellfish" => 4, "strawberries" => 8,
    "tomatoes" => 16, "chocolate" => 32, "pollen" => 64, "cats" => 128
)

allergic_to(score, allergen) = allergen in allergy_list(score)
allergy_list(score) = Set(allergen for (allergen, mask) in ALLERGENS if mask & score == mask)
