defmodule SecretHandshake do
  @commands %{
    0b00001 => "wink",
    0b00010 => "double blink",
    0b00100 => "close your eyes",
    0b01000 => "jump",
    0b10000 => :reverse
  }

  def commands(code) do
    @commands
    |> Enum.filter(fn {action_code, _} -> Bitwise.&&&(code, action_code) == action_code end)
    |> Enum.reduce([], fn {_, action}, handshake -> command(action, handshake) end)
  end

  defp command(:reverse, handshake), do: Enum.reverse(handshake)
  defp command(action, handshake), do: handshake ++ [action]
end
