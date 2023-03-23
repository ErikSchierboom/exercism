from math import hypot, ceil


def score(x, y):
    match ceil(hypot(x, y)):
        case 0 | 1: return 10
        case 2 | 3 | 4 | 5: return 5
        case 6 | 7 | 8 | 9 | 10: return 1
        case _: return 0
