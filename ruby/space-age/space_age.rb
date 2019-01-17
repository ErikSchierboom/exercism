class SpaceAge
  def initialize(age_in_seconds)
    @age_in_seconds = age_in_seconds
  end

  def on_mercury
    earth_years(0.2408467)
  end

  def on_venus
    earth_years(0.61519726)
  end

  def on_earth
    earth_years(1.0)
  end

  def on_mars
    earth_years(1.8808158)
  end

  def on_jupiter
    earth_years(11.862615)
  end

  def on_saturn
    earth_years(29.447498)
  end

  def on_uranus
    earth_years(84.016846)
  end

  def on_neptune
    earth_years(164.79132)
  end

  def earth_years(orbital_period_in_earth_years)
    seconds_per_earth_year = 31_557_600.00
    earth_years = @age_in_seconds / (seconds_per_earth_year * orbital_period_in_earth_years)
    earth_years.round(2)
  end
end