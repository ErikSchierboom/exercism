enum LogLevel
{
    Trace,
    Debug,
    Info = 4,
    Warning,
    Error,
    Fatal,
    Unknown = 42
}

static class LogLine
{
    public static LogLevel ParseLogLevel(string logLine) =>
        logLine[(logLine.IndexOf('[') + 1) .. logLine.IndexOf(']')] switch
        {
            "TRC" => LogLevel.Trace,
            "DBG" => LogLevel.Debug,
            "INF" => LogLevel.Info,
            "WRN" => LogLevel.Warning,
            "ERR" => LogLevel.Error,
            "FTL" => LogLevel.Fatal,
            _ => LogLevel.Unknown
        };

    public static string OutputForShortLog(LogLevel logLevel, string message) =>
        $"{logLevel:D}:{message}";
}
