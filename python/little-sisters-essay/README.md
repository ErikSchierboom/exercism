# Little Sister's Essay

Welcome to Little Sister's Essay on Exercism's Python Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

The `str` class offers [many useful methods][str methods] for working with and composing strings.
These include searching, cleaning, splitting, transforming, translating, and many other techniques.

Strings are [immutable sequences][text sequence] of [Unicode code points][unicode code points] -- individual "characters" or code points (_strings of length 1_) can be referenced by `0-based index` number from the left, or `-1-based index` number from the right.

Strings can be iterated through using `for item in <str>` or `for index, item in enumerate(<str>)` syntax.
They can be concatenated using the `+` operator or via `<string>.join(<iterable>)` and implement all [common sequence operations][common sequence operations].

Strings are _immutable_, meaning the value of a `str` object in memory cannot change.
Functions or methods that operate on a `str` (_like the ones we are learning about here_) will return a new `instance` of that `str` object instead of modifying the original `str`.

Following is a small selection of Python string methods.
For a complete list, see the [str class][str methods] in the Python docs.


[`<str>.title()`][str-title] parses a string and capitalizes the first "character" of each "word" found.
In Python, this is very dependent on the [language codec][codecs] used and how the particular language represents words and characters.
There may also be [locale][locale] rules in place for a language or character set.


```python
man_in_hat_th = 'ู้ชายในหมวก'
man_in_hat_ru = 'mужчина в шляпе'
man_in_hat_ko = '모자를 쓴 남자'
main_in_hat_en = 'the man in the hat.'

>>> man_in_hat_th.title()
'ผู้ชายในหมวก'

>>> man_in_hat_ru.title()
'Мужчина В Шляпе'

>>> man_in_hat_ko.title()
'모자를 쓴 남자'

>> main_in_hat_en.title()
'The Man In The Hat.'
```

[`<str>.endswith(<suffix>)`][str-endswith] returns `True` if the string ends with `<suffix>`, `False` otherwise.


```python
>>> 'My heart breaks. 💔'.endswith('💔')
True

>>> 'cheerfulness'.endswith('ness')
True

# Punctuation is part of the string, so needs to be included in any endswith match.
>>> 'Do you want to 💃?'.endswith('💃')
False

>> 'The quick brown fox jumped over the lazy dog.'.endswith('dog')
False
```

[`<str>.strip(<chars>)`][str-strip] returns a copy of the `str` with leading and trailing `<chars>` removed.
The code points specified in `<chars>` are not a prefix or suffix - **all combinations** of the code points will be removed starting from **both ends** of the string.
 If nothing is specified for `<chars>`, all combinations of whitespace code points will be removed.


 ```python
# This will remove "https://", because it can be formed from "/stph:". 
>>> 'https://unicode.org/emoji/'.strip('/stph:')
'unicode.org/emoji'

# Removal of all whitespace from both ends of the str.
>>> '   🐪🐪🐪🌟🐪🐪🐪   '.strip()
'🐪🐪🐪🌟🐪🐪🐪'

>>> justification = 'оправдание'
>>> justification.strip('еина')
'оправд'

# Prefix and suffix in one step.
>>> 'unaddressed'.strip('dnue')
'address'

>>> '  unaddressed  '.strip('dnue ')
'address'
```


[`<str>.replace(<substring>, <replacement substring>)`][str-replace] returns a copy of the string with all occurrences of `<substring>` replaced with `<replacement substring>`.

The quote used below is from [The Hunting of the Snark][The Hunting of the Snark] by [Lewis Carroll][Lewis Carroll]

```python
# The Hunting of the Snark, by Lewis Carroll
>>> quote = '''
"Just the place for a Snark!" the Bellman cried,
   As he landed his crew with care;
Supporting each man on the top of the tide
   By a finger entwined in his hair.

"Just the place for a Snark! I have said it twice:
   That alone should encourage the crew.
Just the place for a Snark! I have said it thrice:
   What I tell you three times is true."
'''

>>> quote.replace('Snark', '🐲')
...
'\n"Just the place for a 🐲!" the Bellman cried,\n   As he landed his crew with care;\nSupporting each man on the top of the tide\n   By a finger entwined in his hair.\n\n"Just the place for a 🐲! I have said it twice:\n   That alone should encourage the crew.\nJust the place for a 🐲! I have said it thrice:\n   What I tell you three times is true."\n'

>>> 'bookkeeper'.replace('kk', 'k k')
'book keeper'
```

[Lewis Carroll]: https://www.poetryfoundation.org/poets/lewis-carroll
[The Hunting of the Snark]: https://www.poetryfoundation.org/poems/43909/the-hunting-of-the-snark
[codecs]: https://docs.python.org/3/library/codecs.html
[common sequence operations]: https://docs.python.org/3/library/stdtypes.html#text-sequence-type-str
[locale]: https://docs.python.org/3/library/locale.html#module-locale
[str methods]: https://docs.python.org/3/library/stdtypes.html#string-methods
[str-endswith]: https://docs.python.org/3/library/stdtypes.html#str.endswith
[str-replace]: https://docs.python.org/3/library/stdtypes.html#str.replace
[str-strip]: https://docs.python.org/3/library/stdtypes.html#str.strip
[str-title]: https://docs.python.org/3/library/stdtypes.html#str.title
[text sequence]: https://docs.python.org/3/library/stdtypes.html#text-sequence-type-str
[unicode code points]: https://stackoverflow.com/questions/27331819/whats-the-difference-between-a-character-a-code-point-a-glyph-and-a-grapheme

## Instructions

In this exercise you are helping your younger sister edit her paper for school. The teacher is looking for correct punctuation, grammar, and excellent word choice.

You have four tasks to clean up and modify strings.

## 1. Capitalize the title of the paper

Any good paper needs a properly formatted title.
Implement the function `capitalize_title(<title>)` which takes a title `str` as a parameter and capitalizes the first letter of each word.
This function should return a `str` in title case.


```python
>>> capitalize_title("my hobbies")
"My Hobbies"
```

## 2. Check if each sentence ends with a period

You want to make sure that the punctuation in the paper is perfect.
Implement the function `check_sentence_ending()` that takes `sentence` as a parameter. This function should return a `bool`.


```python
>>> check_sentence_ending("I like to hike, bake, and read.")
True
```

## 3. Clean up spacing

To make the paper look professional, unnecessary spacing needs to be removed.
Implement the function `clean_up_spacing()` that takes  `sentence` as a parameter.
The function should remove extra whitespace at both the beginning and the end of the sentence, returning a new, updated sentence `str`.


```python
>>> clean_up_spacing(" I like to go on hikes with my dog.  ")
"I like to go on hikes with my dog."
```

## 4. Replace words with a synonym

To make the paper _even better_, you can replace some of the adjectives with their synonyms.
Write the function `replace_word_choice()` that takes `sentence`, `old_word`, and `new_word` as parameters.
This function should replace all instances of the `old_word` with the `new_word`, and return a new `str` with the updated sentence.


```python
>>> replace_word_choice("I bake good cakes.", "good", "amazing")
"I bake amazing cakes."
```

## Source

### Created by

- @kimolivia

### Contributed to by

- @valentin-p
- @bethanyg