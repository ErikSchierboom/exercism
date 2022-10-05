defmodule DndCharacter do
  defstruct ~w[strength dexterity constitution intelligence wisdom charisma hitpoints]a

  def modifier(score), do: Integer.floor_div(score - 10, 2)

  def ability do
    Enum.take_random(1..6, 4)
    |> Enum.sort()
    |> Enum.drop(1)
    |> Enum.sum()
  end

  def character do
    constitution = ability()

    %DndCharacter{
      strength: ability(),
      dexterity: ability(),
      constitution: constitution,
      intelligence: ability(),
      wisdom: ability(),
      charisma: ability(),
      hitpoints: 10 + modifier(constitution)
    }
  end
end
