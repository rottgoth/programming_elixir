list_concat = fn a , b -> a ++ b end


list_concat.([:a, :b], [:c, :d]) #=> [:a, :b, :c, :d]

sum = fn a, b, c -> a + b + c end
sum.(1, 2, 3) #=> 6


pair_tuple_to_list = fn { a, b } -> [ a, b ] end
pair_tuple_to_list.( { 1234, 5678 } ) #=> [ 1234, 5678 ]




Exercise: Functions-2
Write a function that takes three arguments. If the first two are zero, return “FizzBuzz.” If the first is zero, return “Fizz.” If the second is zero, return “Buzz.” Otherwise return the third argument. Do not use any language features that we haven’t yet covered in this book.

fb = fn
  0, 0, _ -> "FizzBuzz"
  0, _, _ -> "Fizz"
  _, 0, _ -> "Buzz"
  _, _, a -> a
end

Exercise: Functions-3
The operator rem(a, b) returns the remainder after dividing a by b. Write a function that takes a single integer (n) and calls the function in the previous exercise, passing it rem(n,3), rem(n,5), and n. Call it seven times with the arguments 10, 11, 12, and so on. You should get “Buzz, 11, Fizz, 13, 14, FizzBuzz, 16.”

test = fn n -> fb.(rem(n, 3), rem(n, 5), n) end

test.(10)
test.(11)
test.(12)
test.(13)
test.(14)
test.(15)
test.(16)

Exercise: Functions-4
Write a function prefix that takes a string. It should return a new function that takes a second string. When that second function is called, it will return a string containing the first string, a space, and the second string.

​   iex> mrs = prefix.(​"​​Mrs"​)
​   ​#Function<erl_eval.6.82930912>​
​   iex> mrs.(​"​​Smith"​)
​   ​"​​Mrs Smith"​
​   iex> prefix.(​"​​Elixir"​).(​"​​Rocks"​)
​   ​"​​Elixir Rocks"​”

prefix = fn a -> fn b -> "#{a} #{b}" end end


Exercise: Functions-5
Use the &… notation to rewrite the following.

Enum.map [1,2,3,4], fn x -> x + 2 end
Enum.map [1,2,3,4], &(&1 + 2)


Enum.each [1,2,3,4], fn x -> IO.inspect x end
Enum.each [1,2,3,4], &(IO.inspect &1)
Enum.each [1,2,3,4], &IO.inspect/1