defmodule MyList do
  def span(x, y) when x > y, do: []
  def span(x, y), do: [ x | span(x + 1, y)]
end