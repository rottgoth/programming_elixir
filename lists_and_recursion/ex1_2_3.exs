defmodule MyList do

  # Exercise: ListsAndRecursion-1
  # Write a mapsum function that takes a list and a function. It applies the function to each element of the list and then sums the result, so
# ​   ​iex>​ MyList.mapsum [1, 2, 3], &(&1 * &1)
# ​   14

  def mapsum(list, fun, value \\0)

  def mapsum([], _fun, value), do: value

  def mapsum([head|tail], fun, value) do
    mapsum(tail, fun, value + fun.(head))
  end
  # Exercise: ListsAndRecursion-2
  # Write a max(list) that returns the element with the maximum value in the list. (This is slightly trickier than it sounds.)

  def mymax(_list, value \\0)
  def mymax([], value), do: value

  def mymax([head | tail], value) when head > value, do: mymax(tail, head)
  def mymax([head | tail], value) when head < value, do: mymax(tail, value)

# Exercise: ListsAndRecursion-3
# An Elixir single-quoted string is actually a list of individual character codes. Write a caesar(list, n) function that adds n to each list element, wrapping if the addition results in a character greater than z.

# ​   ​iex>​ MyList.caesar(​'ryvkve'​, 13)
# ​   ?????? :)”

  def caesar([], n), do: []
  def caesar([head | tail], n) when head + n > ?z, do: [head + n - (?z-?a + 1) | caesar(tail, n)]
  def caesar([head | tail], n), do: [head + n | caesar(tail, n)]

end