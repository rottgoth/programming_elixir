# Exercise: MoreCoolStuff-2
# The function Float.parse converts leading characters of a string to a float, returning either a tuple containing the value and the rest of the string, or the atom :error.

# Update your CSV sigil so that numbers are automatically converted:

# ​   csv = ​~​v​"""​
# ​   ​1,2,3.14​
# ​   ​cat,dog​
# ​   ​"""​
# should generate [[1.0,2.0,3.14], ["cat","dog"]].
defmodule CsvSigil do
  def sigil_v(strings, _opts) do
    strings
    |> String.trim_trailing
    |> String.split("\n")
    |> Enum.map(&parse_line/1)
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

defmodule Ex2 do
  import CsvSigil

  def test do
    csv = ~v"""
    1,2,3.14​
    cat,dog
    """
  end
end

IO.inspect(Ex2.test)