# “Exercise: ModulesAndFunctions-7
# Find the library functions to do the following, and then use each in iex. (If the word Elixir or Erlang appears at the end of the challenge, then you’ll find the answer in that set of libraries.)

# Convert a float to a string with two decimal digits. (Erlang)
:io.format("Test ~5.2f", [32.123])

# Get the value of an operating-system environment variable. (Elixir)

System.get_env("PATH")

# Return the extension component of a file name (so return .exs if given "dave/test.exs"). (Elixir)

Path.extname("dave/test.exs")

# Return the process’s current working directory. (Elixir)

System.cwd

# Convert a string containing JSON into Elixir data structures. (Just find; don’t install.)

# https://github.com/devinus/poison
# Poison.Parser.parse!(~s({"name": "Devin Torres", "age": 27}))

# Execute a command in your operating system’s shell.”

System.cmd("ls",[])
