defmodule RationalNumbers do
  @type rational :: {integer, integer}

  def add({a1, b1}, {a2, b2}) do
    {a1 * b2 + a2 * b1, b1 * b2} |> reduce()
  end

  def subtract({a1, b1}, {a2, b2}) do
    {a1 * b2 - a2 * b1, b1 * b2} |> reduce()
  end

  def multiply({a1, b1}, {a2, b2}) do
    {a1 * a2, b1 * b2} |> reduce()
  end

  def divide_by({a1, b1}, {a2, b2}) do
    {a1 * b2, a2 * b1} |> reduce()
  end

  def abs({a, b}) do
    {Kernel.abs(a), Kernel.abs(b)} |> reduce()
  end

  def pow_rational({a, b}, n) do
    if n < 0 do
      {b ** Kernel.abs(n), a ** Kernel.abs(n)} |> reduce()
    else
      {a ** n, b ** n} |> reduce()
    end
  end

  @spec pow_real(x :: integer, n :: rational) :: float
  def pow_real(x, {a, b}) do
    x ** a ** (1 / b)
  end

  def reduce({a, b}) do
    gcd = Integer.gcd(a, b)
    reduced_a = Integer.floor_div(a, gcd)
    reduced_b = Integer.floor_div(b, gcd)
    factor = if reduced_b < 0, do: -1, else: 1

    {factor * reduced_a, factor * reduced_b}
  end
end
