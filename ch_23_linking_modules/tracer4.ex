defmodule Tracer do

  import IO.ANSI

  def dump_args(args) do
    args |> Enum.map(&inspect/1) |> Enum.join(", ")
  end

  def dump_defn(name, args) do
    "#{name}(#{dump_args(args)})"
  end

  #defmacro def({:when, _, name,_,args}, content) do

  defmacro def(definition={name,_,args}, content) do
    IO.puts "**"
    IO.puts inspect(definition)
    IO.puts inspect(content)

    {name, _, args} =
      case name do
        :when -> hd(args)
        _     -> definition
      end

    IO.puts "--"
    IO.puts inspect(name)
    IO.puts inspect(args)
    quote do
      Kernel.def(unquote(definition)) do
        IO.puts [red(), "==> call: ", green(), "  #{Tracer.dump_defn(unquote(name), unquote(args))}"]
        result = unquote(content)
        IO.puts [red(), "<== result: ", green(), inspect(result)]
        result
      end
    end
  end

  defmacro __using__(_opts) do
    quote do
      import Kernel, except: [def: 2]
      import unquote(__MODULE__), only: [def: 2]
    end
  end
end

defmodule Test do
  use Tracer
  def puts_sum_three(a,b,c), do: IO.inspect(a+b+c)
  def puts_sum_two(a,b) when a > 0, do: IO.inspect(a+b)
  def add_list(list),        do: Enum.reduce(list, 0, &(&1+&2))
end

Test.puts_sum_three(1,2,3)
Test.puts_sum_two(1,2)
Test.add_list([5,6,7,8])