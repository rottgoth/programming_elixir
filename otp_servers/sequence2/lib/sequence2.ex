defmodule Sequence2 do
  @moduledoc """
  Documentation for Sequence2.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Sequence2.hello
      :world

  """
  @server Sequence2.Server

  def start_link(current_number) do
    GenServer.start_link(@server, current_number, name: @server)
  end

  def next_number do
    GenServer.call @server, :next_number
  end

  def increment_number(delta) do
    GenServer.cast @server, {:increment_number, delta}
  end
end
