from collections import Counter

YACHT = 0
ONES = 1
TWOS = 2
THREES = 3
FOURS = 4
FIVES = 5
SIXES = 6
FULL_HOUSE = 7
FOUR_OF_A_KIND = 8
LITTLE_STRAIGHT = 9
BIG_STRAIGHT = 10
CHOICE = 11


def score(dice, category):
    if category == YACHT:
        return yacht_score(dice)
    elif category == ONES:
        return single_score(dice, 1)
    elif category == TWOS:
        return single_score(dice, 2)
    elif category == THREES:
        return single_score(dice, 3)
    elif category == FOURS:
        return single_score(dice, 4)
    elif category == FIVES:
        return single_score(dice, 5)
    elif category == SIXES:
        return single_score(dice, 6)
    elif category == FULL_HOUSE:
        return full_house_score(dice)
    elif category == FOUR_OF_A_KIND:
        return four_of_a_kind_score(dice)
    elif category == LITTLE_STRAIGHT:
        return little_straight_score(dice)
    elif category == BIG_STRAIGHT:
        return big_straight_score(dice)
    elif category == CHOICE:
        return sum(dice)


def yacht_score(dice):
    return 50 if len(set(dice)) == 1 else 0


def full_house_score(dice):
    match Counter(dice).most_common():
        case [(_, 3), (_, 2)]:
            return sum(dice)
        case _:
            return 0


def four_of_a_kind_score(dice):
    match Counter(dice).most_common():
        case [(die, 4), (_, 1)] | [(die, 5)]:
            return die * 4
        case _:
            return 0


def little_straight_score(dice):
    return 30 if sorted(dice) == [1, 2, 3, 4, 5] else 0


def big_straight_score(dice):
    return 30 if sorted(dice) == [2, 3, 4, 5, 6] else 0


def single_score(dice, target):
    return sum(die for die in dice if die == target)
