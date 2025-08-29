def reverse [n] (str: [n]u8): [n]u8 =
  map (\i -> str[n -i - 1]) (0..<n)
