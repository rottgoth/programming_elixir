defmodule MultipleProcesses do
  def run do
    pid1 = spawn(MultipleProcesses, :send_token, [])
    pid2 = spawn(MultipleProcesses, :send_token, [])

    send pid1, {self(), "fred"}
    send pid2, {self(), "betty"}
    receive do
      {:ok, token} -> IO.puts token
    end

    receive do
      {:ok, token} -> IO.puts token
    end
  end

  def send_token do
    receive do
      {sender, token} ->
        send sender, {:ok, token}
        send_token()
    end
  end
end
