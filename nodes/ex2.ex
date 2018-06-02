# Exercise: Nodes-2
# When I introduced the interval server, I said it sent a tick “about every 2 seconds.” But in the receive loop, it has an explicit timeout of 2,000 ms. Why did I say “about” when it looks as if the time should be pretty accurate?

# Exercise: Nodes-3
# Alter the code so that successive ticks are sent to each registered client (so the first goes to the first client, the second to the next client, and so on). Once the last client receives a tick, the process starts back at the first. The solution should deal with new clients being added at any time.

defmodule Ticker do

  @interval 2000   # 2 seconds
  @name     :ticker

  def start do
    pid = spawn(__MODULE__, :generator, [[], []])
    :global.register_name(@name, pid)
  end

  def register(client_pid) do
    send :global.whereis_name(@name), { :register, client_pid }
  end

  def generator(clients, queue) do
    receive do
      { :register, pid } ->
        IO.puts "registering #{inspect pid}"
        generator([pid|clients], queue)
    after
      @interval ->
        IO.puts "tick"
        {clients, queue} = process_clients(clients, queue)
        generator(clients, queue)
    end
  end

  defp process_clients([], []), do: {[], []}
  defp process_clients([], queue), do: process_clients(queue, [])
  defp process_clients(clients, queue) do
    [next_client | reversed_clients] = Enum.reverse(clients)
    send next_client, { :tick }
    clients = Enum.reverse(reversed_clients) # minus the one ticked
    queue = [next_client | queue] # plus the one ticked
    {clients, queue}
  end
end

defmodule Client do

  def start do
    pid = spawn(__MODULE__, :receiver, [])
    Ticker.register(pid)
  end

  def receiver do
    receive do
      { :tick } ->
        IO.puts "tock in client"
        receiver()
    end
  end
end