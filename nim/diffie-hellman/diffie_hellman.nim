import math, random

randomize()

proc privateKey*(p: int): int =
  rand(2 ..< p)

proc publicKey*(p, g, privateKey: int): int =
  g ^ privateKey mod p

proc secret*(p, publicKey, privateKey: int): int =
  publicKey ^ privateKey mod p
