sett = set([4,3,3,2,1])
assert len(sett) == 4

sett.remove(1)
assert len(sett) == 3

sett.add(5)
assert len(sett) == 4
