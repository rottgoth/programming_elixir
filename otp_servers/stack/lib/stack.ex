defmodule Stack do
  @moduledoc """
  Documentation for Stack.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Stack.hello
      :world

  """
  @server Stack.Server

  def start_link(stack \\[]) do
    GenServer.start_link @server, stack, name: @server
  end

  def pop, do: GenServer.call @server, :pop

  def push(value), do: GenServer.cast @server, {:push, value}
end
