def square_root(number):
    i = 1
    result = 1
    while result <= number:
        i += 1
        result = i * i

    return i - 1
