#[derive(Debug)]
pub struct Duration(u64);

impl From<u64> for Duration {
    fn from(s: u64) -> Self {
        Self(s)
    }
}

pub trait Planet {
    const RELATIVE_ORBITAL_PERIOD: f64;
    const SECONDS_IN_EARTH_YEAR: f64 = 31_557_600.0;

    fn years_during(d: &Duration) -> f64 {
        d.0 as f64 / Self::RELATIVE_ORBITAL_PERIOD / Self::SECONDS_IN_EARTH_YEAR
    }
}

macro_rules! planet_impl {
    ($planet:ident, $orbital_period:expr) => {
        pub struct $planet;

        impl Planet for $planet {
            const RELATIVE_ORBITAL_PERIOD: f64 = $orbital_period;
        }
    };
}

planet_impl!(Mercury, 0.2408467);
planet_impl!(Venus, 0.61519726);
planet_impl!(Earth, 1.0);
planet_impl!(Mars, 1.8808158);
planet_impl!(Jupiter, 11.862615);
planet_impl!(Saturn, 29.447498);
planet_impl!(Uranus, 84.016846);
planet_impl!(Neptune, 164.79132);
