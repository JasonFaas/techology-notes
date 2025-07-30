class Node():
  def __init__(self, val):
    self.val = val
    self.next = None

head = Node(3)
head.next = Node(4)
head.next.next = Node(2)
assert head.next.val == 4
head = head.next
assert head.next.val == 2
