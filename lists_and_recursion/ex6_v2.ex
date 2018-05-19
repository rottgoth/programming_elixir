# Exercise: ListsAndRecursion-6
# (Hard) Write a flatten(list) function that takes a list that may contain any number of sublists, which themselves may contain sublists, to any depth. It returns the elements of these lists as a flat list.

# ​   ​iex>​ MyList.flatten([ 1, [ 2, 3, [4] ], 5, [[[6]]]])
# ​   [1,2,3,4,5,6]
# Hint: You may have to use Enum.reverse to get your result in the correct order.