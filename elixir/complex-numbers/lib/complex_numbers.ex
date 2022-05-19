defmodule ComplexNumbers do
  import Kernel, except: [div: 2]

  @type complex :: {float, float}

  def real({r, _}), do: r

  def imaginary({_, i}), do: i

  def mul({r1, i1}, {r2, i2}), do: {r1 * r2 - i1 * i2, i1 * r2 + r1 * i2}
  def mul(r1, r2), do: mul(to_complex(r1), to_complex(r2))

  def add({r1, i1}, {r2, i2}), do: {r1 + r2, i1 + i2}
  def add(r1, r2), do: add(to_complex(r1), to_complex(r2))

  def sub({r1, i1}, {r2, i2}), do: {r1 - r2, i1 - i2}
  def sub(r1, r2), do: sub(to_complex(r1), to_complex(r2))

  def div({r1, i1}, {r2, i2}) do
    {r3, i3} = mul({r1, i1}, conjugate({r2, i2}))
    {r4, _} = mul({r2, i2}, conjugate({r2, i2}))

    {r3 / r4, i3 / r4}
  end

  def div(r1, r2), do: div(to_complex(r1), to_complex(r2))

  def abs({r, i}), do: :math.sqrt(r ** 2 + i ** 2)

  def conjugate({r, i}), do: {r, -i}

  def exp({r, i}), do: {:math.exp(r) * :math.cos(i), :math.exp(r) * :math.sin(i)}

  defp to_complex({r, i}), do: {r, i}
  defp to_complex(r), do: {r, 0}
end
