from functools import partial

EARTH_YEAR_SECONDS = 31_557_600


ORBITAL_PERIODS = {
    "mercury": 0.2408467,
    "venus": 0.61519726,
    "earth": 1.0,
    "mars": 1.8808158,
    "jupiter": 11.862615,
    "saturn": 29.447498,
    "uranus": 84.016846,
    "neptune": 164.79132
}


class SpaceAge:
    def __init__(self, seconds):
        for planet, orbital_period in ORBITAL_PERIODS.items():
            setattr(self, f'on_{planet}', partial(self.calculate_age, seconds, orbital_period))

    @staticmethod
    def calculate_age(seconds, orbital_period):
        return round(seconds / orbital_period / EARTH_YEAR_SECONDS, 2)