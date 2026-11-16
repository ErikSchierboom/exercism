using Random

generate_key() = randstring('a':'z', 100)

shift(c::Char, by::Char, op) = 'a' + mod(op(c - 'a', by - 'a'), 26)
shift(text, key, op) = join(shift(c, k, op) for (c, k) in zip(text, Iterators.cycle(key)))

encode(plaintext, key) = shift(plaintext, key, +)
decode(ciphertext, key) = shift(ciphertext, key, -)
