class SpaceAge
  def initialize(age_in_seconds)
    ORBITAL_PERIODS_IN_EARTH_YEARS.each do |planet, orbital_period_in_earth_years|
      define_singleton_method "on_#{planet}" do
        earth_years = age_in_seconds / (SECONDS_PER_EARTH_YEAR * orbital_period_in_earth_years)
        earth_years.round(2)
      end
    end
  end

  private
  SECONDS_PER_EARTH_YEAR = 31_557_600.00
  ORBITAL_PERIODS_IN_EARTH_YEARS = {
    mercury: 0.2408467,
    venus: 0.61519726,
    earth: 1.0,
    mars: 1.8808158,
    jupiter: 11.862615,
    saturn: 29.447498,
    uranus: 84.016846,
    neptune: 164.79132
  }.freeze
  private_constant :SECONDS_PER_EARTH_YEAR
end