actions <- c(
  \(commands) { append(commands, "wink") },
  \(commands) { append(commands, "double blink") },
  \(commands) { append(commands, "close your eyes") },
  \(commands) { append(commands, "jump") },
  \(commands) { rev(commands)}
)

handshake <- function(n) {
  commands <- c()
  
  for (index in seq_along(actions)) {
    if (bitwAnd(bitwShiftL(1, index - 1), n) != 0) {
      commands <- actions[[index]](commands)
    }
  }
  
  commands
}
