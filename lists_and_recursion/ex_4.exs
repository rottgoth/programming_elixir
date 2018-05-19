# Exercise: ListsAndRecursion-4
# Write a function MyList.span(from, to) that returns a list of the numbers from from up to to.”

defmodule MyList do
  def span(_from, _to, list \\[])
  def span(from, from, list), do: [from | list]
  def span(from, to, list), do: span(from, to - 1, [to|list])
end
