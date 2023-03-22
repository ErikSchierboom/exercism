from string import ascii_lowercase, ascii_uppercase


def rotate(text, key):
    rotate_map = shift_map(ascii_lowercase, key) | shift_map(ascii_uppercase, key)
    return ''.join(rotate_map.get(char, char) for char in text)


def shift_map(array, key):
    return dict(zip(array, array[key:] + array[:key]))
