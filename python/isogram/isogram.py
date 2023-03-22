def is_isogram(string):
    letters = [char for char in string.lower() if char.isalpha()]
    return len(set(letters)) == len(letters)
