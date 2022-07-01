defmodule RomanNumerals do
  @thresholds [
    {1000, "M"},
    {900, "CM"},
    {500, "D"},
    {400, "CD"},
    {100, "C"},
    {90, "XC"},
    {50, "L"},
    {40, "XL"},
    {10, "X"},
    {9, "IX"},
    {5, "V"},
    {4, "IV"},
    {1, "I"}
  ]

  def numeral(num), do: numeral(num, @thresholds, "")

  defp numeral(0, _, acc), do: acc

  defp numeral(num, [{threshold, roman} | rest], acc) when threshold <= num do
    numeral(num - threshold, [{threshold, roman} | rest], acc <> roman)
  end

  defp numeral(num, [_ | rest], acc) do
    numeral(num, rest, acc)
  end
end
