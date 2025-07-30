def fb(val):
  ret_str_arr = []
  if val % 3 == 0:
    ret_str_arr.append("f")
  if val % 5 == 0:
    ret_str_arr.append("b")

  if len(ret_str_arr) == 0:
    return str(val)
  else:
    return ''.join(ret_str_arr)

assert fb(1) == "1"
assert fb(2) == "2"
assert fb(3) == "f"
assert fb(5) == "b"
assert fb(6) == "f"
assert fb(15) == "fb"

print("All tests completed")
