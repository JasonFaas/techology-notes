what = {"usa": 300, "china": 10000}

for k,v in what.items():
  print(k + " : " + str(v))

assert "usa" in what

assert 300 in list(what.values()), "wrong"

del what["usa"]
assert len(what) == 1

print(what)

