function r(n, b, a, o, r) {
  for (r = b = "", a = 5; n; b++, a ^= 7)
    for (o = n % a, n = (n / a) ^ 0; o--; )
      r = "IVXLCDM".charAt(o > 2 ? b + n - (n &= ~1) + (o = 1) : b) + r;
  return r;
}
