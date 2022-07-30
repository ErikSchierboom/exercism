defmodule Prime do
  def nth(0), do: raise 'There is no zeroth prime'
  def nth(count), do: Enum.at(primes(), count - 1)

  def primes do
    other_primes =
      Stream.unfold(6, &({&1, &1 + 6}))
      |> Stream.flat_map(&([&1 - 1, &1 + 1]))
      |> Stream.filter(&(is_prime(&1)))

    Stream.concat([2, 3], other_primes)
  end

  def is_prime(n) do
    r = floor(:math.sqrt(n))
    r < 5 || 0 .. r - 4 |> Enum.all?(&(rem(n, 5 + &1) != 0))
  end
end
