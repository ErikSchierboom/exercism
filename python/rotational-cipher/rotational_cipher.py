from string import ascii_lowercase, ascii_uppercase


def rotate(text, key):
    from_text = ascii_lowercase + ascii_uppercase
    to_text = rotate_by(ascii_lowercase, key) + rotate_by(ascii_uppercase, key)
    return text.translate(str.maketrans(from_text, to_text))


def rotate_by(string, key):
    return string[key:] + string[:key]
