# Implement the following Enum functions using no library functions or list 
# comprehensions: all?, each, filter, split, and take. You may need to use an if
# statement to implement filter. The syntax for this is

# ​   ​if​ condition ​do​
# ​     expression(s)
# ​   ​else​
# ​     expression(s)
# ​   ​end​

defmodule MyList do
  def all?(_list, _fun \\&(&1), res \\true)
  def all?([], _fun, res), do: res
  def all?([head | tail], fun, res), do: all?(tail, fun, fun.(head) && res)

  def each(_list, _fun \\&(&1))
  def each([], _fun), do: :ok
  def each([head | tail], fun) do
    fun.(head)
    each(tail, fun)
  end


  # it returns result reversed
  def filter(_list, _fun, res \\[])
  def filter([], _fun, res), do: res
  def filter([head | tail], fun, res) do
    if fun.(head) do
      filter(tail, fun, [head | res])
    else
      filter(tail, fun, res)
    end
  end
end