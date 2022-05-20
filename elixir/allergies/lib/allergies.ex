defmodule Allergies do
  use Bitwise

  @allergens ~w[eggs peanuts shellfish strawberries tomatoes chocolate pollen cats]

  def list(flags) do
    Enum.filter(@allergens, &allergic_to?(flags, &1))
  end

  def allergic_to?(flags, item) do
    (flags &&& 1 <<< Enum.find_index(@allergens, &(&1 == item))) !== 0
  end
end
