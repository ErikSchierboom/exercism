space_age_period(Period, Secs, Years) :- Years is (Secs / Period) / 31557600.0.

space_age("Mercury", Secs, Years) :- space_age_period(0.2408467,  Secs, Years).
space_age("Venus",   Secs, Years) :- space_age_period(0.61519726, Secs, Years).
space_age("Earth",   Secs, Years) :- space_age_period(1.0,        Secs, Years).
space_age("Mars",    Secs, Years) :- space_age_period(1.8808158,  Secs, Years).
space_age("Jupiter", Secs, Years) :- space_age_period(11.862615,  Secs, Years).
space_age("Saturn",  Secs, Years) :- space_age_period(29.447498,  Secs, Years).
space_age("Uranus",  Secs, Years) :- space_age_period(84.016846,  Secs, Years).
space_age("Neptune", Secs, Years) :- space_age_period(164.79132,  Secs, Years).
