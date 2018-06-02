# Exercise: WorkingWithMultipleProcesses-3
# Use spawn_link to start a process, and have that process send a message to the parent and then exit immediately. Meanwhile, sleep for 500 ms in the parent, then receive as many messages as are waiting. Trace what you receive. Does it matter that you weren’t waiting for the notification from the child when it exited?

defmodule MultipleProcesses3 do
  import :timer, only: [sleep: 1]

  def sad_method(parent) do
    send parent, {:ok, "Hello"}
    exit(:adios)
  end

  def run do
    # Process.flag(:trap_exit, true)
    # spawn_link MultipleProcesses3, :sad_method, [self()] # exercise 3
    spawn_monitor MultipleProcesses3, :sad_method, [self()] # exercise 5
    sleep(500)
    receive do
      {:ok, message} ->
        IO.puts "Received message: #{message}"
    after 1000 ->
        IO.puts "Nothing happened as far as I am concerned"
    end
    
  end
end

# MultipleProcesses3.run

# Exercise: WorkingWithMultipleProcesses-4
# Do the same, but have the child raise an exception. What difference do you see in the tracing?

defmodule MultipleProcesses4 do
  import :timer, only: [sleep: 1]

  def sad_method(parent) do
    send parent, {:ok, "Hello"}
    raise "Giving up"
  end

  def run do
    # Process.flag(:trap_exit, true) 
    # spawn_link MultipleProcesses4, :sad_method, [self()] # exercise 4
    spawn_monitor MultipleProcesses4, :sad_method, [self()] # exercise 5
    sleep(500)
    receive do
      {:ok, message} ->
        IO.puts "Received message: #{message}"
    after 1000 ->
        IO.puts "Nothing happened as far as I am concerned"
    end
    
  end
end
MultipleProcesses4.run

# Exercise: WorkingWithMultipleProcesses-5
# Repeat the two, changing spawn_link to spawn_monitor.
