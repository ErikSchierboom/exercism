import re

VOWEL_PATTERN = r'(?P<begin>^|\s+)(?P<vowel>[aeiou]|xr|yt)(?P<rest>\w+)'
CONSONANT_PATTERN = r'(?P<begin>^|\s+)(?P<consonant>([^aeiou]?qu|[^aeiou]+))(?P<rest>[aeiouy]\w*)'

VOWEL_REPLACEMENT = r'\g<begin>\g<vowel>\g<rest>ay'
CONSONANT_REPLACEMENT = r'\g<begin>\g<rest>\g<consonant>ay'


def translate(text):
    return re.sub(VOWEL_PATTERN, VOWEL_REPLACEMENT, text) if re.match(VOWEL_PATTERN, text) else \
        re.sub(CONSONANT_PATTERN, CONSONANT_REPLACEMENT, text)
