defmodule MyString do

  def center([]), do: []
  def center(words) do
    words
     |> Enum.map_reduce(0, &accumulate_max_length/2)
     |> center_strings
     |> Enum.each(&IO.puts/1)
  end

  defp accumulate_max_length(string, max_length) do
    length = String.length(string)
    { {string, length}, max(length, max_length) }
  end

  defp center_strings({strings, max_length}) do
    strings |> Enum.map( &(center_string(max_length, &1)) )
  end

  defp center_string(max_length, {string, length}) do
    new_length = div(max_length + length, 2)
    String.pad_leading(string, new_length)
  end
end