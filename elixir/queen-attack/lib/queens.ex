defmodule Queens do
  @type t :: %Queens{black: {integer, integer}, white: {integer, integer}}
  defstruct [:white, :black]

  @rows 0..7
  @cols 0..7

  def new(opts \\ []) do
    white = Keyword.get(opts, :white)
    black = Keyword.get(opts, :black)

    unless(valid?(white) and valid?(black), do: raise ArgumentError)
    if(white == black, do: raise ArgumentError)

    %Queens{black: black, white: white}
  end

  defp valid?(nil), do: true
  defp valid?({row, col}), do: row in @rows and col in @cols

  def to_string(%Queens{black: black, white: white}) do
    Enum.map(@rows, fn row ->
      Enum.map(@cols, fn col ->
        case {row, col} do
          ^black -> "B"
          ^white -> "W"
          _ -> "_"
        end
      end)
      |> Enum.join(" ")
    end)
    |> Enum.join("\n")
  end

  def can_attack?(%Queens{black: nil}), do: false
  def can_attack?(%Queens{white: nil}), do: false
  def can_attack?(%Queens{black: {b_row, b_col}, white: {w_row, w_col}}) do
    b_row == w_row || b_col == w_col || abs(b_row - w_row) == abs(b_col - w_col)
  end
end
