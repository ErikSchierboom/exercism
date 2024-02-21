import re

def abbreviate(words):
    return re.sub(r'(?<!_)\B[a-zA-Z\']+|[ ,\-_]', '', words.upper())
