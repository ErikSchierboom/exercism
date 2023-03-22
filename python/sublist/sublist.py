SUBLIST = 1
SUPERLIST = 2
EQUAL = 3
UNEQUAL = 4


def sublist(a, b):
    if a == b:
        return EQUAL
    if is_sublist(a, b):
        return SUBLIST
    if is_sublist(b, a):
        return SUPERLIST

    return UNEQUAL


def is_sublist(a, b):
    return a in [b[i:i + len(a)] for i in range(0, len(b) - len(a) + 1)]
