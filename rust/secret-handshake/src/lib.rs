pub fn actions(n: u8) -> Vec<&'static str> {
    let mut commands: Vec<&'static str> = Vec::with_capacity(4);

    if n & 0b00001 != 0 { commands.push("wink") }
    if n & 0b00010 != 0 { commands.push("double blink") }
    if n & 0b00100 != 0 { commands.push("close your eyes") }
    if n & 0b01000 != 0 { commands.push("jump") }
    if n & 0b10000 != 0 { commands.reverse() }

    commands
}
