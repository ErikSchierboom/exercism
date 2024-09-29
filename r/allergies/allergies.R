allergens <- c("eggs", "peanuts", "shellfish", "strawberries", "tomatoes", "chocolate", "pollen", "cats")

allergy <- function(num) {
  allergens[as.logical(intToBits(num))] |> na.exclude()
}

allergic_to <- function(allergy_object, allergy) {
  allergy %in% allergy_object
}

list_allergies <- function(allergy_object) {
  allergy_object
}
