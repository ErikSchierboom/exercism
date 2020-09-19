import re, strutils

let validIsbn = re"^(\d{9}(\d|X))$"

proc removeDashes(isbn: string): string =
  isbn.replace("-", "")

proc digit(c: char): int =
  if c == 'X': 10 else: parseInt($c)

proc checksum(isbn: string): int =
  for i in countdown(isbn.len, 1):
    result += isbn[i - 1].digit * i

proc isValid*(isbn: string): bool =
  if isbn.removeDashes =~ validIsbn:
    let isbn = matches[0]
    isbn.checksum mod 11 == 0
  else:
    false
