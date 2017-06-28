defmodule MyString do
  def printable?(str), do: Enum.all? str, &(&1 in ? ..?~)

  def anagram?(word1, word2) do
    Enum.count(word1 -- word2) === 0 && Enum.count(word2 -- word1) === 0
    # book solution
    Enum.sort(word1) == Enum.sort(word2)
  end

  # Exercise 3
  # ​iex>​ [ ​'cat'​ | ​'dog'​ ]
  # ['cat', 100, 111, 103]
  # Why does iex print 'cat' as a string, but 'dog' as individual numbers?
  # Solution:
  # Because the first element of the list is another list containing c, a and t
  # ['cat' | 'dog'] = [ [ ?c, ?a, ?t], ?d, ?o, ?g ]


  def calculate([]), do: []
  def calculate([], n1, ?+, n2), do: n1 + n2
  def calculate([], n1, ?-, n2), do: n1 - n2
  def calculate([], n1, ?*, n2), do: n1 * n2
  def calculate([], n1, ?/, n2), do: n1 / n2

  def calculate(list) do
    index = Enum.find_index(list, &(&1 in '+-*/'))
    {n1, [op | n2]}  = Enum.split(list, index)
    calculate([], parse(n1), op, parse(n2))
  end

  defp parse(_, num \\0)
  defp parse([], n), do: n
  defp parse([h|t], n), do: parse(t, n*10 + (h - ?0))
end