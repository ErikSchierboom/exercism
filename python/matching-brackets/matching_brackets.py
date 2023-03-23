DELIMITERS = {']': '[', ')': '(', '}': '{'}


def is_paired(input_string):
    unmatched = []

    for letter in input_string:
        if letter in DELIMITERS and (not unmatched or unmatched.pop() != DELIMITERS[letter]):
            return False

        if letter in DELIMITERS.values():
            unmatched.append(letter)

    return not unmatched
