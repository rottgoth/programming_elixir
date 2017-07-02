defmodule MyBinary do
  def capitalize_sentences(sentences) do
    sentences
    |> String.split(". ")
    |> Enum.map(&String.capitalize/1)
    |> Enum.join(". ")
  end
end