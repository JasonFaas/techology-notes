def merge_sort(arr):
  arr_len = len(arr)
  if arr_len == 1:
    return arr
  else:
    left = arr[:int(arr_len/2)]
    right = arr[int(arr_len/2):]
    left_s = left
    right_s = right
    if arr_len >= 3:
      left_s = merge_sort(left)
      right_s = merge_sort(right)
    left_idx = 0
    right_idx = 0
    ret_arr = []
    while left_idx < len(left_s) or right_idx < len(right_s):
      if right_idx == len(right) or left_idx != len(left) and left_s[left_idx] < right_s[right_idx]:
        ret_arr.append(left_s[left_idx])
        left_idx += 1
      else:
        ret_arr.append(right_s[right_idx])
        right_idx += 1
    return ret_arr


print("first")
assert merge_sort([1, 3, 2, 5, -2, 6]) == [-2, 1, 2, 3, 5, 6]
print("second test")
assert merge_sort([1, 3, 2, 7, -2, 6]) == [-2, 1, 2, 3, 6, 7]

