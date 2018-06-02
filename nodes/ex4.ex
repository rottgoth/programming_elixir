# Exercise: Nodes-4
# The ticker process in this chapter is a central server that sends events to registered clients. Reimplement this as a ring of clients. A client sends a tick to the next client in the ring. After 2 seconds, that client sends a tick to its next client.

# When thinking about how to add clients to the ring, remember to deal with the case where a client’s receive loop times out just as you’re adding a new process. What does this say about who has to be responsible for updating the links?

defmodule Ticker do

  @interval 2000   # 2 seconds
  @name     :ticker

  def start do
    pid = spawn(__MODULE__, :generator, [nil, nil, nil])
    :global.register_name(@name, pid)
  end

  def register do
    client_pid = spawn(__MODULE__, :receiver, [nil]) 
    send :global.whereis_name(@name), { :register, client_pid }
  end

  def generator(current, first, last) do
    receive do
      { :register, pid } ->
        IO.puts "registering #{inspect pid}"
        # connect new pid to last one
        if last do
          send last, {:connect, pid}
        end

        # map the first registered pid
        unless first, do: first = pid

        # connect latest pid with first to close the ring
        send pid, {:connect, first}

        # map the first registered pid to current
        unless current, do: current = pid

        generator(current, first, pid)
      {:new_current, pid} ->
        generator(pid, first, last)
    after
      @interval ->
        if current do
          send current, { :your_turn }
        else
          IO.puts "."
        end
        generator(current, first, last)
    end
  end

  def receiver(next) do
    receive do
      { :connect, pid } ->
        receiver(pid)
      { :your_turn } ->
        if next do
          IO.puts "tick"
          send next, {:tick}
          send :global.whereis_name(@name), { :new_current, next }
        else
          IO.puts "_"
        end
        receiver(next)
      { :tick } ->
        IO.puts "tock"
        receiver(next)
    end
  end
end
