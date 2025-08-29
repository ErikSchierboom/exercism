def is_isogram [n] (phrase: [n]u8): bool =
  let (_, isogram) = loop (mask, isogram) = (0u32, true) for i < n do
    let lower = phrase[i] | (1 << 5)
    in
      if lower < 'a' || lower > 'z' then
        (mask, isogram)
      else if (mask & (1u32 << u32.u8(lower - 'a'))) != 0 then
        (mask, false)
      else
        (mask | (1u32 << u32.u8(lower - 'a')), isogram)
  in isogram
  