class SpaceAge
  SECONDS_PER_EARTH_YEAR = 31_557_600.00
  PLANET_ORBITAL_PERIODS_IN_EARTH_YEARS = {
    Mercury: 0.2408467,
    Venus: 0.61519726,
    Earth: 1.0,
    Mars: 1.8808158,
    Jupiter: 11.862615,
    Saturn: 29.447498,
    Uranus: 84.016846,
    Neptune: 164.79132
  }.freeze
  private_constant :SECONDS_PER_EARTH_YEAR

  def initialize(age_in_seconds)
    @age_in_seconds = age_in_seconds
  end

  PLANET_ORBITAL_PERIODS_IN_EARTH_YEARS.each do |planet, orbital_period_in_earth_years|  #=> on_mars
    define_method "on_#{planet.downcase}" do
      earth_years = age_in_seconds / (SECONDS_PER_EARTH_YEAR * orbital_period_in_earth_years)
      earth_years.round(2)
    end
  end

  private

  attr_reader :age_in_seconds
end