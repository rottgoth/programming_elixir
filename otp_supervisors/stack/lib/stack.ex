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

  def list, do: GenServer.cast @server, :list

  def pop, do: GenServer.call @server, :pop

  def push(value), do: GenServer.cast @server, {:push, value}
end
