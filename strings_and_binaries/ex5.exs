defmodule MyString do

  def center([]), do: []
  def center(words) do
    count = words
     |> Enum.map_reduce(0, accumulate_max_length(&1, &2))
     |> center_strings
     |> Enum.each(&IO.puts/1)
  end

  defp accumulate_max_length(string, max) do
    length = String.length(string)
    { {string, length}, max(length, max) }
  end

  defp center_strings({strings, max_length}) do
    strings |> Enum.map(String.pad_leading())

  end
end