# Exercise: MoreCoolStuff-3
# (Hard) Sometimes the first line of a CSV file is a list of the column names. Update your code to support this, and return the values in each row as a keyword list, using the column names as the keys. Here’s an example:

# ​   csv = ​~​v​"""​
# ​   ​Item,Qty,Price​
# ​   ​Teddy bear,4,34.95​
# ​   ​Milk,1,2.99​
# ​   ​Battery,6,8.00​
# ​   ​"""​
# would generate

# ​   [
# ​     [​Item:​ ​"​​Teddy bear"​, ​Qty:​ 4, ​Price:​ 34.95],
# ​     [​Item:​ ​"​​Milk"​, ​Qty:​ 1, ​Price:​ 2.99],
# ​     [​Item:​ ​"​​Battery"​, ​Qty:​ 6, ​Price:​ 8.00]
# ​   ]

defmodule CsvSigil do
  def sigil_v(strings, _opts) do
    strings
    |> String.trim_trailing
    |> String.split("\n")
    |> parse_lines
  end

  defp parse_lines([head_line | rest]) do
    header = parse_header(head_line)
    rest
    |> Enum.map(&parse_line/1)
    |> Enum.map(&(Enum.zip(header, &1)))
  end

  defp parse_header(string) do
    string
    |> String.split(",")
    |> Enum.map(&String.to_atom/1)
  end

  defp parse_line(string) do
    string
    |> String.split(",")
    |> Enum.map(&parse_value/1)
  end

  defp parse_value(value) do
    case Float.parse(value) do
      {v, _rest} -> v
      :error     -> value
    end
  end
end

defmodule Ex3 do
  import CsvSigil

  def test do
    csv = ~v"""
    Item,Qty,Price​
    Teddy bear,4,34.95​
    Milk,1,2.99​
    Battery,6,8.00​
    """
  end
end

IO.inspect(Ex3.test)