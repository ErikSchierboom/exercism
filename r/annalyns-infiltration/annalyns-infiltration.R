can_fast_attack <- function(knight_is_awake) {
  !knight_is_awake
}

can_spy <- function(knight_is_awake, archer_is_awake, prisoner_is_awake) {
  knight_is_awake || archer_is_awake || prisoner_is_awake
}

can_signal_prisoner <- function(archer_is_awake, prisoner_is_awake) {
  prisoner_is_awake && !archer_is_awake
}

can_free_prisoner <- function(knight_is_awake,
                              archer_is_awake,
                              prisoner_is_awake,
                              pet_dog_is_present) {
  pet_dog_is_present && !archer_is_awake ||
    prisoner_is_awake && !archer_is_awake && !knight_is_awake
}
