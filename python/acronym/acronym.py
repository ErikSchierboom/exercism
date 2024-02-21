import re

def abbreviate(words):
    return ''.join(re.findall(r'(?<!\')(?:\b|_)([A-Z])', words.upper()))
