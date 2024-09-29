space_age(Planet, Secs, Age) :-
    orbital_period(Planet, OrbitalPeriod),
    Age is Secs / 31557600 / OrbitalPeriod.

orbital_period("Mercury", 0.2408467).
orbital_period("Venus",   0.61519726).
orbital_period("Earth",   1.0).
orbital_period("Mars",    1.8808158).
orbital_period("Jupiter", 11.862615).
orbital_period("Saturn",  29.447498).
orbital_period("Uranus",  84.016846).
orbital_period("Neptune", 164.79132).
