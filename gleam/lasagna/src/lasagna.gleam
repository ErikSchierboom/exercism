pub fn expected_minutes_in_oven() -> Int {
  40
}

pub fn remaining_minutes_in_oven(actual_minutes_in_oven: Int) -> Int {
  expected_minutes_in_oven() - actual_minutes_in_oven
}

pub fn preparation_time_in_minutes(number_of_layers: Int) -> Int {
  number_of_layers * 2
}

pub fn total_time_in_minutes(
  number_of_layers: Int,
  actual_minutes_in_oven: Int,
) -> Int {
  actual_minutes_in_oven + preparation_time_in_minutes(number_of_layers)
}

pub fn alarm() -> String {
  "Ding!"
}
