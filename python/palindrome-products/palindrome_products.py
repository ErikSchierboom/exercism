def largest(min_factor, max_factor):
    """Given a range of numbers, find the largest palindromes which
       are products of two numbers within that range.

    :param min_factor: int with a default value of 0
    :param max_factor: int
    :return: tuple of (palindrome, iterable).
             Iterable should contain both factors of the palindrome in an arbitrary order.
    """

    if min_factor > max_factor:
        raise ValueError("min must be <= max")

    largest_product = None
    factors = []

    for x in range(min_factor, max_factor + 1):
        for y in range(x, max_factor + 1):
            product = x * y

            if product == largest_product:
                factors.append((x, y))
            elif largest_product is None or product > largest_product:
                if is_palindrome(product):
                    largest_product = product
                    factors = [(x, y)]

    return largest_product, factors


def smallest(min_factor, max_factor):
    """Given a range of numbers, find the smallest palindromes which
    are products of two numbers within that range.

    :param min_factor: int with a default value of 0
    :param max_factor: int
    :return: tuple of (palindrome, iterable).
    Iterable should contain both factors of the palindrome in an arbitrary order.
    """

    if min_factor > max_factor:
        raise ValueError("min must be <= max")

    smallest_product = None
    factors = []

    for x in range(min_factor, max_factor + 1):
        for y in range(x, max_factor + 1):
            product = x * y

            if product == smallest_product:
                factors.append((x, y))
            elif smallest_product is None or product < smallest_product:
                if is_palindrome(product):
                    smallest_product = product
                    factors = [(x, y)]

    return smallest_product, factors


def is_palindrome(number):
    n = number
    rev = 0

    while number > 0:
        dig = number % 10
        rev = rev * 10 + dig
        number //= 10

    return n == rev
