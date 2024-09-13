seconds_in_earth_year = 31557600

orbital_periods_in_earth_years = c(
  mercury = 0.2408467,
  venus = 0.61519726,
  earth = 1.0,
  mars = 1.8808158,
  jupiter = 11.862615,
  saturn = 29.447498,
  uranus = 84.016846,
  neptune = 164.79132
)

space_age <- function(seconds, planet) {
  round(seconds / seconds_in_earth_year / orbital_periods_in_earth_years[[planet]], digits = 2)
}
