OrbitalPeriods ← map {"Mercury" "Venus" "Earth" "Mars" "Jupiter" "Saturn" "Uranus" "Neptune"} [0.2408467 0.61519726 1 1.8808158 11.862615 29.447498 84.016846 164.79132]

Round           ← |1 ÷ 100 ⁅ × 100
EarthYearPeriod ← |1 ÷ 31557600
SpaceAge        ← |2 Round ÷ ⍣(get : OrbitalPeriods)(⍤ "not a planet") ⊙EarthYearPeriod
