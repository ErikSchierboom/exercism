space_age_period(Period, AgeSec, Years) :- Years is (AgeSec / Period) / 31557600.0.

space_age("Mercury", AgeSec, Years) :- space_age_period(0.2408467,  AgeSec, Years).
space_age("Venus", AgeSec, Years)   :- space_age_period(0.61519726, AgeSec, Years).
space_age("Earth", AgeSec, Years)   :- space_age_period(1.0,        AgeSec, Years).
space_age("Mars", AgeSec, Years)    :- space_age_period(1.8808158,  AgeSec, Years).
space_age("Jupiter", AgeSec, Years) :- space_age_period(11.862615,  AgeSec, Years).
space_age("Saturn", AgeSec, Years)  :- space_age_period(29.447498,  AgeSec, Years).
space_age("Uranus", AgeSec, Years)  :- space_age_period(84.016846,  AgeSec, Years).
space_age("Neptune", AgeSec, Years) :- space_age_period(164.79132,  AgeSec, Years).
