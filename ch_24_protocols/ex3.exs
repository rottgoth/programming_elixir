# Exercise: Protocols-3
# Collections that implement the Enumerable protocol define count, member?, reduce, and slice functions. The Enum module uses these to implement methods such as each, filter, and map.

# Implement your own versions of each, filter, and map in terms of reduce.

defmodule MyEnum do
  import Enum, only: [reduce: 3]

  def map(list, fun) do
    list
    |> reduce([], fn (x, acc) -> [fun.(x) | acc] end)
    |> Enum.reverse
  end

  def each(list, fun) do
    list
    |> reduce(:ok, fn (x, acc) -> fun.(x) && acc end)
  end

  def filter(list, fun) do
    list
    |> reduce([], &(if (fun.(&1)), do: [&1 | &2], else: &2))
    # |> reduce([], fn (x, acc) ->
    #   case fun.(x) do
    #     false -> acc
    #     _ -> [x | acc]
    #   end
    # end)
    |> Enum.reverse
  end
end