needs_license <- function(vehicle) {
  vehicle %in% c("car", "truck")
}

choose_vehicle <- function(option1, option2) {
  ifelse(option1 <= option2, option1, option2)
}

calculate_resale_price <- function(original_price, age) {
  if (age < 3) return(original_price * 0.8)
  if (age <= 10) return(original_price * 0.7)
  original_price * 0.5
}
