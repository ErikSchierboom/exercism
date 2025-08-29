let letter_scores: []u8 = [1, 3, 3, 2, 1, 4, 2, 4, 1, 8, 5, 1, 3, 1, 1, 3, 10, 1, 1, 1, 1, 4, 4, 8, 4, 10]
def to_lower (c: u8): u8 = c | (1 << 5)
def letter_score (c: u8): u8 = letter_scores[i8.u8((to_lower c) - 'a')]

def score (letters: []u8): i32 = 
  letters
  |> map to_lower
  |> map letter_score
  |> map i32.u8
  |> i32.sum
