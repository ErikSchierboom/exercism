let all_letters = 0b11111111111111111111111111u32

def to_lower (c: u8): u8 = c | (1 << 5)
def is_lower (c: u8): bool = c >= 'a' && c <= 'z'
def to_mask (c: u8): u32 = 1u32 << u32.u8(c - 'a')

def is_pangram [n] (sentence: [n]u8): bool =
  sentence
  |> map to_lower
  |> filter is_lower
  |> map to_mask
  |> reduce (|) 0u32
  |> (== all_letters)
