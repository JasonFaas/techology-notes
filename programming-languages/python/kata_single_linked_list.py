print("Hello World!")


class Node:
  def __init__(self, data):
    self.val = data
    self.next = None


head = Node(3)
head.next = Node(2)
head.next.next = Node(1)
print(head.next.val)

head = head.next
print(head.next.val)

