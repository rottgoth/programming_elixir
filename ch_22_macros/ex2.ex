# Exercise: MacrosAndCodeEvaluation-2
# Write a macro called times_n that takes a single numeric argument. It should define a function called times_n in the caller’s module that itself takes a single argument, and that multiplies that argument by n. So, calling times_n(3) should create a function called times_3, and calling times_3(4) should return 12. Here’s an example of it in use:

​ #  ​defmodule​ Test ​do​
​ #    ​require​ Times
​ #    Times.times_n(3)
​ #    Times.times_n(4)
​ #  ​end​
​ #  
​ #  IO.puts Test.times_3(4)   ​#=> 12​
​ #  IO.puts Test.times_4(5)   ​#=> 20​”

defmodule Times do

  defmacro times_n(number) do
    quote do
      def unquote(:"times_#{number}")(other_number) do
        unquote(number) * other_number
      end
    end
  end

end

defmodule Test do
  require Times
  Times.times_n(3)
  Times.times_n(4)
end

IO.puts Test.times_3(4)
IO.puts Test.times_4(5)