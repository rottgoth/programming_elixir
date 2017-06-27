defmodule MyList do
  def span(x, y) when x > y, do: []
  def span(x, y), do: [ x | span(x + 1, y)]

  def primes_up_to(n) do
    for x <- span(2, n), prime?(x), do: x
  end

  defp prime?(2), do: true
  defp prime?(n) do
    Enum.all? span(2, n-1), &(rem(n, &1) !== 0)
  end
end