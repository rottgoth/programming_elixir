# Exercise: Functions-2
# Write a function that takes three arguments. 
# If the first two are zero, return "FizzBuzz." 
# If the first is zero, return "Fizz."
# If the second is zero, return "Buzz." 
# Otherwise return the third argument. Do not use any language features that we haven’t yet covered in this book.”

handle_zero = fn 
  0,0,_-> IO.puts "FizzBuzz"
  0,_,_-> IO.puts "Fizz"
  _,0,_-> IO.puts "Buzz"
  _,_,a-> IO.puts a
end

handle_zero.(0,0,1)
handle_zero.(0,1,2)
handle_zero.(1,0,1)
handle_zero.(1,1,100)

# Exercise: Functions-3
# The operator rem(a, b) returns the remainder after dividing a by b.
# Write a function that takes a single integer (n) and calls the function 
# in the previous exercise, passing it rem(n,3), rem(n,5), and n.
# Call it seven times with the arguments 10, 11, 12, and so on. You should get “Buzz, 11, Fizz, 13, 14, FizzBuzz, 16.”

fun_funck = fn n ->
  handle_zero.(rem(n,3), rem(n,5), n)
end

fun_funck.(10)
fun_funck.(11)
fun_funck.(12)
fun_funck.(13)
fun_funck.(14)
fun_funck.(15)
fun_funck.(16)


# Exercise: Functions-4
# Write a function prefix that takes a string.
# It should return a new function that takes a second string.
# When that second function is called, it will return a string containing
# the first string, a space, and the second string.

prefix = fn pref ->
           fn name ->
             IO.puts "#{pref} #{name}"
           end
         end

mrs = prefix.("Mrs")
mrs.("Smith")
prefix.("Elixir").("Rocks")


# Exercise: Functions-5
# Use the &… notation to rewrite the following.

# Enum.map [1,2,3,4], fn x -> x + 2 end
# Enum.each [1,2,3,4], fn x -> IO.inspect x end”

Enum.map [1,2,3,4,5], &(IO.puts(&1 + 2))
IO.puts("****")
Enum.map [1,2,3,4,5], &(IO.inspect(&1))
