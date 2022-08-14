defmodule AffineCipher do
  @alphabet Enum.to_list(?a..?z)

  @typedoc """
  A type for the encryption key
  """
  @type key() :: %{a: integer, b: integer}

  @doc """
  Encode an encrypted message using a key
  """
  @spec encode(key :: key(), message :: String.t()) :: {:ok, String.t()} | {:error, String.t()}
  def encode(%{a: a, b: b}, message) do
    if coprime(a, length(@alphabet)) do
      encrypted =
        message
        |> translate(&(a * &1 + b))
        |> Enum.chunk_every(5)
        |> Enum.map_join(" ", &List.to_string/1)

      {:ok, encrypted}
    else
      {:error, "a and m must be coprime."}
    end
  end

  @doc """
  Decode an encrypted message using a key
  """
  @spec decode(key :: key(), message :: String.t()) :: {:ok, String.t()} | {:error, String.t()}
  def decode(%{a: a, b: b}, encrypted) do
    if coprime(a, length(@alphabet)) do
      mmi = modular_inverse(a, length(@alphabet))

      plaintext =
        encrypted
        |> translate(&(mmi * (&1 - b)))
        |> List.to_string()

      {:ok, plaintext}
    else
      {:error, "a and m must be coprime."}
    end
  end

  defp coprime(a, b), do: Integer.gcd(a, b) == 1

  def modular_inverse(a, b) do
    {_, m, _} = Integer.extended_gcd(a, b)
    rem(m + b, b)
  end

  defp translate(text, t) do
    text
    |> String.replace(~r/[^\w]+/, "")
    |> String.downcase()
    |> String.to_charlist()
    |> Enum.map(fn letter ->
      index = Enum.find_index(@alphabet, &(&1 == letter))
      if index == nil do
        letter
      else
        Enum.at(@alphabet, rem(t.(index), length(@alphabet)))
      end
    end)
  end
end
