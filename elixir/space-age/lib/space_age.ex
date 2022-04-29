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
  @seconds_on_earth 31_557_600.0

  defp planet_period(:mercury), do: 0.2408467
  defp planet_period(:venus), do: 0.61519726
  defp planet_period(:earth), do: 1.0
  defp planet_period(:mars), do: 1.8808158
  defp planet_period(:jupiter), do: 11.862615
  defp planet_period(:saturn), do: 29.447498
  defp planet_period(:uranus), do: 84.016846
  defp planet_period(:neptune), do: 164.79132
  defp round_to_two_decimals(value), do: round(value * 100.0) / 100.0

  @spec age_on(planet, pos_integer) :: float
  def age_on(planet, seconds) do
    age_on_planet = seconds / planet_period(planet) / @seconds_on_earth
    round_to_two_decimals(age_on_planet)
  end
end
