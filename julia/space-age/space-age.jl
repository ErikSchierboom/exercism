PLANETS = Dict(
    "Mercury" => 0.2408467,
    "Venus" => 0.61519726,
    "Earth" => 1.0,
    "Mars" => 1.8808158,
    "Jupiter" => 11.862615,
    "Saturn" => 29.447498,
    "Uranus" => 84.016846,
    "Neptune" => 164.79132,
)

EARTH_YEAR_SECONDS = 31_557_600

for (planet, orbitalperiod) in PLANETS
    eval(quote
        $(Symbol("on$planet"))(seconds) = seconds / EARTH_YEAR_SECONDS / $orbitalperiod
    end)
end
