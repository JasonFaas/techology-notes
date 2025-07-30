arr = [1, 2, ]
assert len(arr) == 2

arr.append(3)
assert len(arr) == 3

del arr[0]
assert arr[0] == 2

try:
  arr.remove(1) # should be an error
  assert False
except ValueError:
  pass
arr.remove(2) # should not be an error
assert arr == [3, ], str(arr)
