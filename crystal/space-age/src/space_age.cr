class Space::Age
  def initialize(@seconds : Int32)
  end

  def self.from_seconds(seconds)
    new(seconds)
  end

  macro age_on(planet, orbital_period_in_earth_years)
    def age_on_{{planet.id}}
      earth_years = @seconds / (SECONDS_PER_EARTH_YEAR * {{orbital_period_in_earth_years}})
      earth_years.round(2)
    end
  end

  age_on :mercury, 0.2408467
  age_on :venus, 0.61519726
  age_on :earth, 1.0
  age_on :mars, 1.8808158
  age_on :jupiter, 11.862615
  age_on :saturn, 29.447498
  age_on :uranus, 84.016846
  age_on :neptune, 164.79132

  SECONDS_PER_EARTH_YEAR = 31_557_600.00
end
