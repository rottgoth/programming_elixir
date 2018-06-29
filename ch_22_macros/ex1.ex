# Exercise: MacrosAndCodeEvaluation-1
# Write a macro called myunless that implements the standard unless functionality. You’re allowed to use the regular if expression in it.”

defmodule My do
  defmacro unless(condition, clauses) do
    do_clause = Keyword.get(clauses, :do, nil)
    else_clause = Keyword.get(clauses, :else, nil)

    quote do
      if !unquote(condition) do
        unquote(do_clause)
      else
        unquote(else_clause)
      end
    end
  end
end

defmodule Test do
  require My

  My.unless 1 > 2 do
    IO.puts "1 is not greater than 2"
  else
    IO.puts "1 is greater than 2"
  end
end