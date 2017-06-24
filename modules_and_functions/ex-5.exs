# Exercise: ModulesAndFunctions-5
# Write a function gcd(x,y) that
# finds the greatest common divisor between two nonnegative integers.
# Algebraically, gcd(x,y) is x if y is zero; it’s gcd(y, rem(x,y)) otherwise.

defmodule Div do
  def gcd(x, 0), do: x
  def gcd(x, y), do: gcd(y, rem(x,y))
end

# iex modules_and_functions/ex-5.exs
# Div.gcd(2, 24)
# > 2
# Div.gcd(12, 2)
# > 2
