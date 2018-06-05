defmodule Stack.Server do
  use GenServer

  alias Stack.Stash

  def start_link(_) do
    GenServer.start_link(__MODULE__, nil, name: __MODULE__)
  end

  def init(_) do
    {:ok, Stash.get() }
  end

  def handle_call(:pop, _from, [head | stack]) do
    {:reply, head, stack}
  end

  def handle_cast({:push, value}, _stack) when value < 0 do
    raise "No negatives here!"
  end

  def handle_cast({:push, value}, stack) do
    {:noreply, [value | stack]}
  end

  def handle_cast(:list, stack) do
    IO.puts "The stack is: #{inspect stack}"
    {:noreply, stack}
  end

  def format_status(_reason, [_pdict, state]) do
    [data: [{'State', "My stack is -> #{inspect state}"}]]
  end

  def terminate(reason, state) do
    Stash.update(state)
    IO.puts "****"
    IO.puts reason
    IO.puts "****"
  end
end