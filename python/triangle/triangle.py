def equilateral(sides):
    return valid(sides) and len(set(sides)) == 1


def isosceles(sides):
    return valid(sides) and len(set(sides)) <= 2


def scalene(sides):
    return valid(sides) and len(set(sides)) == 3


def valid(sides):
    sides = sorted(sides)
    return all(side > 0 for side in sides) and sides[0] + sides[1] >= sides[2]
