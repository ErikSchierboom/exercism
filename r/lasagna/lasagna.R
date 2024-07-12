expected_minutes_in_oven <- function() {
  60
}

remaining_time_in_minutes <- function(actual_minutes_in_oven) {
  expected_minutes_in_oven() - actual_minutes_in_oven
}

prep_time_in_minutes <- function(number_of_layers) {
  number_of_layers * 2
}

elapsed_time_in_minutes <- function(number_of_layers, actual_minutes_in_oven) {
  prep_time_in_minutes(number_of_layers) + actual_minutes_in_oven
}
