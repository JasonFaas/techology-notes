def fizzbuzz(n: int) -> str:
    if n % 3 == 0 and n % 5 == 0:
        return "fb"
    if n % 3 == 0:
        return "f"
    if n % 5 == 0:
        return "b"
    return str(n)


