defmodule SpaceAge do
  @type planet ::
          :mercury
          | :venus
          | :earth
          | :mars
          | :jupiter
          | :saturn
          | :uranus
          | :neptune

  @planet_periods %{
    :mercury => 0.2408467,
    :venus => 0.61519726,
    :earth => 1.0,
    :mars => 1.8808158,
    :jupiter => 11.862615,
    :saturn => 29.447498,
    :uranus => 84.016846,
    :neptune => 164.79132
  }

  @seconds_on_earth 31_557_600.0

  @spec age_on(planet, pos_integer) :: {atom, float}
  def age_on(planet, seconds) do
    case @planet_periods[planet] do
      nil ->
        {:error, "not a planet"}

      planet_period ->
        {:ok, Float.round(seconds / planet_period / @seconds_on_earth, 2)}
    end
  end
end
