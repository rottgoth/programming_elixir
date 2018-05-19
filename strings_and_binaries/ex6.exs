defmodule MyBinary do
  # def capitalize_sentences(sentences) do
  #   sentences
  #   |> String.split(". ")
  #   |> Enum.map(&String.capitalize/1)
  #   |> Enum.join(". ")
  # end


  def capitalize_sentences(sentences) do
    sentences
    |> String.split(". ")
    |> Enum.map(&capitalize/1)
    |> Enum.join(". ")
  end

  defp capitalize(<<h::utf8, t::binary>>), do: <<String.upcase(h), String.downcase(t)>>
end