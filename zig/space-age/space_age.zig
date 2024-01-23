pub const Planet = enum {
    mercury,
    venus,
    earth,
    mars,
    jupiter,
    saturn,
    uranus,
    neptune,

    const secondsInEarthOrbit = 31_557_600.0;

    pub fn age(self: Planet, seconds: usize) f64 {
        const seconds_in_earth_years = self.orbital_period_in_earth_year() * secondsInEarthOrbit;
        return @as(f64, @floatFromInt(seconds)) / seconds_in_earth_years;
    }

    fn orbital_period_in_earth_year(self: Planet) f64 {
        return switch (self) {
            Planet.mercury => 0.2408467,
            Planet.venus => 0.61519726,
            Planet.earth => 1.0,
            Planet.mars => 1.8808158,
            Planet.jupiter => 11.862615,
            Planet.saturn => 29.447498,
            Planet.uranus => 84.016846,
            Planet.neptune => 164.79132,
        };
    }
};
