# I defined our sum function to carry a partial total around as a second parameter.
# I did this so I could illustrate how to use accumulators to build values.
# The sum function can also be written without an accumulator. Can you do it?

defmodule MyList do
  def sum1([]),              do: 0
  def sum1([ head | tail ]), do: head + sum1(tail)
end

IO.puts MyList.sum1([1,2,3])       #=> 6
IO.puts MyList.sum1([1,2,3,4,5])   #=> 15