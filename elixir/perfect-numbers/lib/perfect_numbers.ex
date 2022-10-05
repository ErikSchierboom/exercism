defmodule PerfectNumbers do
  def classify(number) when number < 1 do
    {:error, "Classification is only possible for natural numbers."}
  end

  def classify(1), do: {:ok, :deficient}

  def classify(number) do
    case aliquot_sum(number) do
      sum when sum > number -> {:ok, :abundant}
      sum when sum < number -> {:ok, :deficient}
      _ -> {:ok, :perfect}
    end
  end

  defp aliquot_sum(number) do
    1..ceil(number / 2)
    |> Stream.filter(&(rem(number, &1) === 0))
    |> Enum.sum()
  end
end
