let is_lower (c: u8) = c >= 'a' && c <= 'z'
let is_upper (c: u8) = c >= 'A' && c <= 'Z'
let is_space (c: u8) = c == ' ' || c == '\t' || c == '\r' || c == '\n'

let is_silence (input: []u8) = all is_space input
let is_question (input: []u8) =
  input
  |> filter (\c -> !(is_space c))
  |> last
  |> (=='?')
let is_shout (input: []u8) = !any is_lower input && any is_upper input

let response (input: []u8): []u8 =
  if is_silence input then "Fine. Be that way!" else
  if is_question input && is_shout input then "Calm down, I know what I'm doing!" else
  if is_question input then "Sure." else
  if is_shout input then "Whoa, chill out!" else
  "Whatever."
