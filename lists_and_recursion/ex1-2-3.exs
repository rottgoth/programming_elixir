defmodule MyList do
  def mapsum(list, value \\0, func)
  def mapsum([], value, func), do: value

  def mapsum([head | tail], value, func) do
    mapsum(tail, value + func.(head), func)
  end

  def max1([head | tail]), do: max1(tail, head)
  def max1([], value), do: value
  def max1([head | tail], value) when head >= value, do: max1(tail, head)
  def max1([head | tail], value) when head < value, do: max1(tail, value)

  def caesar([], _), do: []
  def caesar([head | tail], n) when (head + n) <= ?z, do: [ head+n, caesar(tail, n) ]
  def caesar([head | tail], n), do: [ head+n-26, caesar(tail, n) ]

end
