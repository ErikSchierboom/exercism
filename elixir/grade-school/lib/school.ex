defmodule School do
  def new(), do: %{}

  def add(school, name, grade) do
    if Enum.member?(roster(school), name) do
      {:error, school}
    else
      {:ok, Map.update(school, grade, [name], &[name | &1])}
    end
  end

  def grade(school, grade) do
    Map.get(school, grade, [])
    |> Enum.sort()
  end

  def roster(school) do
    school
    |> Map.keys()
    |> Enum.sort()
    |> Enum.flat_map(&grade(school, &1))
  end
end
