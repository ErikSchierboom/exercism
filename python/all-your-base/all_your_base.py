from itertools import dropwhile


def rebase(input_base, digits, output_base):
    if input_base < 2:
        raise ValueError("input base must be >= 2")
    if output_base < 2:
        raise ValueError("output base must be >= 2")
    if any(digit for digit in digits if digit < 0 or digit >= input_base):
        raise ValueError("all digits must satisfy 0 <= d < input base")

    digits = list(dropwhile(lambda n: n == 0, digits))

    if len(digits) == 0:
        return [0]

    return from_decimal(output_base, to_decimal(input_base, digits))


def to_decimal(from_base, digits):
    decimal = 0

    for digit in digits:
        decimal *= from_base
        decimal += digit

    return decimal


def from_decimal(to_base, num):
    digits = []
    remainder = num
    multiplier = 1

    while remainder > 0:
        multiplier *= to_base

        value = remainder % multiplier
        digit = value // (multiplier // to_base)

        digits.insert(0, digit)
        remainder -= value

    return digits
