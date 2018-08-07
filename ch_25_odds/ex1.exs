# Exercise: MoreCoolStuff-1
# Write a sigil ~v that parses multiple lines of comma-separated data, returning a list where each element is a row of data and each row is a list of values. Don’t worry about quoting—just assume each field is separated by a comma.

# For example

# ​   csv = ​~​v​"""​
# ​   ​1,2,3​
# ​   ​cat,dog​
# ​   ​"""​
# would generate [["1","2","3"], ["cat","dog"]].

defmodule CsvSigil do
  def sigil_v(strings, _opts) do
    strings
    |> String.trim_trailing
    |> String.split("\n")
    |> Enum.map(&(String.split(&1, ",")))
  end
end

defmodule Ex1 do
  import CsvSigil

  def test do
    csv = ~v"""
    1,2,3
    cat,dog
    """
  end
end

IO.inspect(Ex1.test)