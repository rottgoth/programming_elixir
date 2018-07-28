defmodule My do
  defmacro mydef(name) do
    quote do
      def unquote(name)(), do: unquote(name)
    end
  end
end

defmodule Test do
  require My
  # My.mydef(:somename)
  [ :fred, :bert ] |> Enum.each(&My.mydef(&1))
end

# IO.puts Test.somename
IO.puts Test.fred