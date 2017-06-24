defmodule Times do
  def double(n) do
    n * 2
  end

  #Exercise: ModulesAndFunctions-1
  #Extend the Times module with a triple function that multiplies its parameter by three.
  def triple(n), do: n * 3

  # Exercise: ModulesAndFunctions-3
  # Add a quadruple function. (Maybe it could call the double function.…)”
  def quadruple(n) do
    n
    |> double
    |> double
  end
end