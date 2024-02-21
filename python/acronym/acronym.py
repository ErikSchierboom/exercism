import re

def abbreviate(words):
    return re.sub(r'\B(.)| ', '', words.upper())
