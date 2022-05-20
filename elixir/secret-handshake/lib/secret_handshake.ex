defmodule SecretHandshake do
  @commands %{
    0b00001 => &SecretHandshake.wink/1,
    0b00010 => &SecretHandshake.double_blink/1,
    0b00100 => &SecretHandshake.close_your_eyes/1,
    0b01000 => &SecretHandshake.jump/1,
    0b10000 => &Enum.reverse/1
  }

  def commands(code) do
    @commands
    |> Enum.reduce([], fn {command_code, command_fn}, handshake ->
      if Bitwise.&&&(code, command_code) == 0 do
        handshake
      else
        command_fn.(handshake)
      end
    end)
  end

  def wink(handshake), do: handshake ++ ["wink"]
  def double_blink(handshake), do: handshake ++ ["double blink"]
  def close_your_eyes(handshake), do: handshake ++ ["close your eyes"]
  def jump(handshake), do: handshake ++ ["jump"]
end
