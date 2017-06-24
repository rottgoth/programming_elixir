# Exercise: ListsAndRecursion-1
# Write a mapsum function that takes a list and a function.
# It applies the function to each element of the list and then sums the result, so
​#   ​iex>​ MyList.mapsum [1, 2, 3], &(&1 * &1)
​#   14

defmodule MyList do
  def mapsum(list, fun) do
    _mapsum(list, 0, fun)
  end

  defp _mapsum([], total, _fun), do: total
  defp _mapsum([head | tail], total, fun) do
    _mapsum(tail, fun.(head) + total, fun)
  end
end

​MyList.mapsum [1, 2, 3], &(&1 * &1)



# Exercise: ListsAndRecursion-2
# Write a max(list) that returns the element with the maximum value in the list.
# (This is slightly trickier than it sounds.)







# Exercise: ListsAndRecursion-3
# An Elixir single-quoted string is actually a list of individual character codes.
# Write a caesar(list, n) function that adds n to each list element, wrapping
# if the addition results in a character greater than z.

​#   ​iex>​ MyList.caesar(​'ryvkve'​, 13)
​#   ?????? :)”
