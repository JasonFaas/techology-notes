

numbers = list(range(2,100))

evens = list(filter(lambda x: x % 2 == 0, numbers))

print(evens)
print(list(range(2,100,2)))
assert evens == list(range(2,100,2))


print("Hello World!")

