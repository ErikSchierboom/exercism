Planets         ← {"Mercury" "Venus" "Earth" "Mars" "Jupiter" "Saturn" "Uranus" "Neptune"}
OrbitalPeriods  ← [0.2408467 0.61519726 1 1.8808158 11.862615 29.447498 84.016846 164.79132]
Period          ← map Planets OrbitalPeriods
EarthYearPeriod ← ÷31557600
SpaceAge        ← ⁅₂÷ ⍣(˜get Period|⍤ "not a planet") ⊙EarthYearPeriod
