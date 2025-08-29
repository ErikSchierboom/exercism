def check_command (code: i32, mask: i32, command: []u8, acc: []u8): []u8 =
  if code & mask == 0 then
    acc
  else if null acc then
    command
  else
    acc ++ ", " ++ command

def commands (code: i32): []u8 =
  if code & 0b10000 == 0 then
    ""
    |> (\acc -> check_command(code, 0b00001, "wink", acc))
    |> (\acc -> check_command(code, 0b00010, "double blink", acc))
    |> (\acc -> check_command(code, 0b00100, "close your eyes", acc))
    |> (\acc -> check_command(code, 0b01000, "jump", acc))
  else
    ""
    |> (\acc -> check_command(code, 0b01000, "jump", acc))
    |> (\acc -> check_command(code, 0b00100, "close your eyes", acc))
    |> (\acc -> check_command(code, 0b00010, "double blink", acc))
    |> (\acc -> check_command(code, 0b00001, "wink", acc))
  

