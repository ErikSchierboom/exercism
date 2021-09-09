module LogLevels

let message (logLine: string) = logLine.[logLine.IndexOf(':') + 2..].Trim()

let logLevel (logLine: string) = logLine.[1..logLine.IndexOf(']') - 1].ToLower()

let reformat (logLine: string) = $"{message logLine} ({logLevel logLine})"
