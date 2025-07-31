import math

print(5.2//2)

def dict_search(d, char):
  mid = math.floor(len(d)/2)

  if d[mid] == char:
    return mid

  if len(d) == 2:
    return 0 if d[0] == char else 1

  if ord(char) > ord(d[mid]):
    return mid + 1 + dict_search(d[mid+1:], char)
  else:
    return dict_search(d[:mid], char)


  return 9

print(chr(65))


chars_int = list(range(65,65+26))

chars_char = list(map(lambda x: chr(x), chars_int))

pos_j = dict_search(chars_char, "J")

assert pos_j == 9
assert dict_search(chars_char, "A") == 0

print("Dict Search: hello world!")
