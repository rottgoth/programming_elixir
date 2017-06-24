# Find the library functions to do the following, and then use each in iex.
# (If there’s the word Elixir or Erlang at the end of the challenge,
# then you’ll find the answer in that set of libraries.)

# Convert a float to a string with 2 decimal digits. (Erlang)
iex(1)> :io.format("~.2f~n",[2.0/3.0])
0.67
:ok
# Get the value of an operating system environment variable. (Elixir)
iex(2)> System.get_env("HOME")
"/Users/rob"
# Return the extension component of a file name (so return .exs if given "dave/test.exs" (Elixir)
iex(3)> Path.extname("dave/test.exs")
".exs"
# Return the current working directory of the process. (Elixir)
iex(4)> File.cwd
{:ok, "/Users/rob/dev/programming_elixir"}
# Convert a string containing JSON into Elixir data structures. (Just find, don’t install)
https://github.com/devinus/poison
# Execute an command in your operating system’s shell
iex(5)> System.cmd("whoami",[])
{"rob\n", 0}