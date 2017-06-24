defmodule MyEnum do
  def all?(list, val \\ true, func)
  def all?([], true, _), do: true
  def all?(_, false, _), do: false
  def all?([head | tail], _, func), do: all?(tail, func.(head), func)

  def each([], _), do: :ok
  def each([head | tail], func) do
    func.(head)
    each(tail, func)
  end

  def filter([], _), do: []
  def filter([head | tail], func) do
    if func.(head) do
      [head | filter(tail, func)]
    else
      filter(tail, func)
    end
  end


  def split([], _), do: {[], []}
  def split(list, 0), do: {[], list}
  def split(list, count) when count < 0 do
    {second, first} = split(Enum.reverse(list), count * -1)
    {Enum.reverse(first), Enum.reverse(second)}
  end
  def split([head | tail], count) do
    {first, second} = split(tail, count - 1)
    {[head | first], second}
  end

  def take([], _), do: []
  def take(_, 0), do: []
  def take(list, count) when count < 0, do: Enum.reverse take(Enum.reverse(list), count * -1)
  def take([head | tail], count), do: [head | take(tail, count - 1)]
end