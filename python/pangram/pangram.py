import string


def is_pangram(sentence):
    return set(sentence.lower()) >= set(string.ascii_lowercase)
