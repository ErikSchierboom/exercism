def is_isogram(string):
    letters = [char for char in string.lower() if char.isalnum()]
    return len(set(letters)) == len(letters)
