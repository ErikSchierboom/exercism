let seconds_in_earth_year = 31557600.0f64

def hash (planet: []u8): u64 = planet |> map u64.u8 |> u64.sum

def orbital_period_in_earth_year(planet: []u8): f64 =
  if hash planet == hash "Mercury" then 0.2408467 else
  if hash planet == hash "Venus" then 0.61519726 else
  if hash planet == hash "Earth" then 1.0 else
  if hash planet == hash "Mars" then 1.8808158 else
  if hash planet == hash "Jupiter" then 11.862615 else
  if hash planet == hash "Saturn" then 29.447498 else
  if hash planet == hash "Uranus" then 84.016846 else
  if hash planet == hash "Neptune" then 164.7913 else
  assert false 0.0

def age (planet: []u8) (seconds: i64): f64 =
  (f64.i64 seconds) / (orbital_period_in_earth_year planet * seconds_in_earth_year)
  |> (\planet_age -> planet_age * 100 |> f64.round |> (/ 100.0f64))