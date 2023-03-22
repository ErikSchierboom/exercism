from re import match


def is_valid(isbn):
    m = match(r'^\d{9}[\dX]$', isbn.replace('-', ''))

    if not m:
        return False

    return sum(10 if char == 'X' else int(char) * (10 - i) for i, char in enumerate(m.string)) % 11 == 0
