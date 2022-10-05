defmodule DiffieHellman do
  def generate_private_key(prime_p) do
    Enum.random(1..(prime_p - 1))
  end

  def generate_public_key(prime_p, prime_g, private_key) do
    :crypto.mod_pow(prime_g, private_key, prime_p) |> :binary.decode_unsigned()
  end

  def generate_shared_secret(prime_p, public_key_b, private_key_a) do
    :crypto.mod_pow(public_key_b, private_key_a, prime_p) |> :binary.decode_unsigned()
  end
end
