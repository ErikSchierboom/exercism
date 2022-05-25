defmodule Series do
  def largest_product(_, 0), do: 1
  def largest_product(0, _), do: 0
  def largest_product(_, size) when size < 0, do: raise(ArgumentError)

  def largest_product(number, size) when is_integer(number) do
    number
    |> Integer.digits()
    |> Enum.chunk_every(size, 1, :discard)
    |> Enum.map(&Enum.product/1)
    |> Enum.max(fn -> raise ArgumentError end)
  end

  def largest_product(number_string, size) do
    number_string
    |> String.to_integer()
    |> largest_product(size)
  end
end
