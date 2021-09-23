static class Badge
{
    public static string Print(int? id, string name, string? department)
    {
        var printId = id.HasValue ? $"[{id}] - " : "";
        var printDeparment = $" - {department?.ToUpper() ?? "OWNER"}";

        return $"{printId}{name}{printDeparment}";
    }
}
