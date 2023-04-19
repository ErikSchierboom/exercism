from re import findall
from collections import Counter

def count_words(sentence):
    return dict(Counter(findall("[a-z0-9]+(?:'[a-z0-9]+)*", sentence.lower())))
