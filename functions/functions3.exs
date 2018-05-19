# “Exercise: Functions-2
# Write a function that takes three arguments. If the first two are zero, return “FizzBuzz.” If the first is zero, return “Fizz.” If the second is zero, return “Buzz.” Otherwise return the third argument. Do not use any language features that we haven’t yet covered in this book.

fb = fn
  0, 0, _ -> "FizzBuzz"
  0, _, _ -> "Fizz"
  _, 0, _ -> "Buzz"
  _, _, v -> v
end
# Exercise: Functions-3
# The operator rem(a, b) returns the remainder after dividing a by b. Write a function that takes a single integer (n) and calls the function in the previous exercise, passing it rem(n,3), rem(n,5), and n. Call it seven times with the arguments 10, 11, 12, and so on. You should get “Buzz, 11, Fizz, 13, 14, FizzBuzz, 16.”

print_fb = fn
  n -> fb.(rem(n, 3), rem(n, 5), n) |> IO.puts 
end

10..16 |> Enum.each(&print_fb.(&1))

# “Exercise: Functions-4
# Write a function prefix that takes a string. It should return a new function that takes a second string. When that second function is called, it will return a string containing the first string, a space, and the second string.

# ​   iex> mrs = prefix.(​"​​Mrs"​)
# ​   ​#Function<erl_eval.6.82930912>​
# ​   iex> mrs.(​"​​Smith"​)
# ​   ​"​​Mrs Smith"​
# ​   iex> prefix.(​"​​Elixir"​).(​"​​Rocks"​)
# ​   ​"​​Elixir Rocks"​”

prefix = fn pr ->
  fn name -> "#{pr} #{name}" end
end

mrs = prefix.("Mrs")
IO.puts mrs.("Smith")
IO.puts prefix.("Elixir").("Rocks")