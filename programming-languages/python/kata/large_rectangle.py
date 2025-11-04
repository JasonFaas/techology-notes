print("HW!")

def larg_rect(heights):
  pass
  # get min height * width as starting minimum
  # create stack
  # add to stack if increasing
  # pop if decreasing
  # verify last part is taken care of
  returnRect = min(heights) * len(heights)
  
  sHI = [] # stacksHeightsIdx
  idx = 0

  while idx < len(heights):
    print(idx)
    print(returnRect)
    while sHI and heights[idx] < heights[sHI[-1]]:
      returnRect = max(returnRect, heights[sHI[-1]] * (idx - sHI[-1]))
      sHI.pop()
    if not sHI:
      returnRect = max(returnRect, heights[idx] * (idx+1))
    elif heights[sHI[-1]] == heights[idx]:
      sHI[-1] = idx
      sHI.pop()
    sHI.append(idx)
    idx += 1
 
  print(sHI) 
  while sHI:
    print(returnRect)
    returnRect = max(returnRect, heights[sHI[-1]] * (idx - sHI[-1]))
    sHI.pop()

  return returnRect

what = larg_rect([3,3,4,4,2,2])
assert what == 12, what

assert larg_rect([1,2,3,4,5][::-1]) == 9, larg_rect([1,2,3,4,5][::-1])
assert larg_rect([1,3,5,9,11][::-1]) == 18
assert larg_rect([11,11,10,10,10][::-1]) == 50


print("All tests passed")
