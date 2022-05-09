defmodule CaptainsLog do
  @planetary_classes ["D", "H", "J", "K", "L", "M", "N", "R", "T", "Y"]

  def random_planet_class(), do: Enum.random(@planetary_classes)

  def random_ship_registry_number(), do: "NCC-#{:rand.uniform(9000) + 999}"

  def random_stardate(), do: :rand.uniform() * 1000 + 41_000

  def format_stardate(stardate) do
    :io_lib.format("~.1f", [stardate]) |> to_string()
  end
end
