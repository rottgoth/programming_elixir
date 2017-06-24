defmodule Chop do
  def guess(n, low..high) when n == div(low+high, 2) do
    IO.puts n
  end
  def guess(n, low..high) when n > div(low+high, 2) do
    IO.puts "Is it #{_half(low, high)}"
    guess(n, _half(low, high)..high)
  end

  def guess(n, low..high) when n < div(low+high, 2) do
    IO.puts "Is it #{_half(low, high)}"
    guess(n, low.._half(low, high))
  end

  def _half(x,y) do
    div(x+y, 2)
  end
end

# Exercise: ModulesAndFunctions-6
# I’m thinking of a number between 1 and 1000.…

#The most efficient way to find the number is to guess halfway between the low and high numbers of the range. If our guess is too big, then the answer lies between the bottom of the range and one less than our guess. If our guess is too small, then the answer lies between one more than our guess and the end of the range.

#Your API will be guess(actual, range), where range is an Elixir range.

#Your output should look similar to this:
