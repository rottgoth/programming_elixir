defmodule Stack.Server do
  use GenServer

  def init(stack) do
    {:ok, stack}
  end

  def handle_call(:pop, _from, [head | stack]) do
    {:reply, head, stack}
  end

  def handle_cast({:push, value}, _stack) when value < 10 do
    System.halt(value)
  end

  def handle_cast({:push, value}, stack) do
    {:noreply, [value | stack]}
  end

  def format_status(_reason, [_pdict, state]) do
    [data: [{'State', "My stack is -> #{inspect state}"}]]
  end

  def terminate(reason, _state) do
    IO.puts "****"
    IO.puts reason
  end
end