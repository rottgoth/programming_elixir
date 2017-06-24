# foldr/3
# insert_at/3           keydelete/3           keyfind/3
# keyfind/4             keymember?/3          keyreplace/4
# keysort/2             keystore/4            keytake/3
# last/1                replace_at/3          to_atom/1
# to_existing_atom/1    to_float/1            to_integer/1
# to_integer/2          to_string/1           to_tuple/1
# update_at/3           wrap/1                zip/1

defmodule Lists do

  #Deletes the given item from the list. Returns a list without the item. If the
  #item occurs more than once in the list, just the first occurrence is removed.

  # Examples

  # iex> List.delete([1, 2, 3], 1)
  # [2, 3]
  #
  # iex> List.delete([1, 2, 2, 3], 2)
  # [1, 2, 3]

  def delete([head | tail], item) when head === item, do: tail
  def delete([head | tail], item), do: [head | delete(tail, item)]


  # Produces a new list by removing the value at the specified index. Negative
  # indices indicate an offset from the end of the list. If index is out of bounds,
  # the original list is returned.

  # Examples

  # iex> Lists.delete_at([1, 2, 3], 0)
  # [2, 3]
  #
  # iex> Lists.delete_at([1, 2, 3], 10)
  # [1, 2, 3]
  #
  # iex> Lists.delete_at([1, 2, 3], -1)
  # [1, 2]

  def delete_at(list, n), do: delete_at(list, n, Enum.count(list))
  def delete_at([_ | tail], 0, _), do: tail
  def delete_at(list, n, count) when n > count, do: list
  def delete_at([head | tail], n, count) when n > 0, do: [head | delete_at(tail, n-1, count)]
  def delete_at(list, n, count) when n < 0, do: delete_at(list, count + n)

  # Duplicates the given element n times in a list.
  # iex> List.duplicate("hello", 3)
  # ["hello", "hello", "hello"]
  #
  # iex> List.duplicate([1, 2], 2)
  # [[1, 2], [1, 2]]

  def duplicate(element, 0), do: []
  def duplicate(element, n), do: [element | duplicate(element, n-1)]

  # Returns the first element in list or nil if list is empty.

  # Examples

  # iex> Lists.first([])
  # nil
  #
  # iex> Lists.first([1])
  # 1
  #
  # iex> Lists.first([1, 2, 3])
  # 1

  def first([]), do: nil
  def first([head | _]), do: head


  # Flattens the given list of nested lists.
  # Examples

  # iex> Lists.flatten([1, [[2], 3]])
  # [1, 2, 3]

   # def flatten(list, tail)

  # Flattens the given list of nested lists. The list tail will be added at the end
  # of the flattened list.

  # Examples

  # iex> List.flatten([1, [[2], 3]], [4, 5])
  # [1, 2, 3, 4, 5]

  def flatten([]), do: []
  def flatten([head | tail]), do: flatten(head) ++ flatten(tail)
  def flatten(value), do: [value]
  def flatten([head | tail], list), do: flatten(head) ++ flatten(tail) ++ flatten(list)

  # Folds (reduces) the given list from the left with a function. Requires an
  # accumulator.

  # Examples

  # ┃ iex> Lists.foldl([5, 5], 10, fn(x, acc) -> x + acc end)
  # ┃ 20
  # ┃
  # ┃ iex> Lists.foldl([1, 2, 3, 4], 0, fn(x, acc) -> x - acc end)
  # ┃ 2

  def foldl([], acc, _), do: acc
  def foldl([head | tail], acc, func) do
    foldl(tail, func.(head, acc), func)
  end



  # Folds (reduces) the given list from the right with a function. Requires an
  # accumulator.

  # Examples

  # ┃ iex> List.foldr([1, 2, 3, 4], 0, fn(x, acc) -> IO.puts("x: #{x}, acc: #{acc}");x - acc end)
  # ┃ -2
  def foldr([], acc, _), do: acc
  def foldr([head | tail], acc, func), do
    func.(head, foldr(tail, acc, func), func)
  end

end

1  = 10 + x
x = 1 - 10