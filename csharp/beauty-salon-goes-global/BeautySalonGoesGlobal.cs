using System;
using System.Data;
using System.Globalization;
using System.Linq;

public enum Location
{
    NewYork,
    London,
    Paris
}

public enum AlertLevel
{
    Early,
    Standard,
    Late
}

public static class Appointment
{
    public static DateTime ShowLocalTime(DateTime dtUtc) => dtUtc.ToLocalTime();

    public static DateTime Schedule(string appointmentDateDescription, Location location) =>
        TimeZoneInfo.ConvertTimeToUtc(DateTime.Parse(appointmentDateDescription), location.ToTimeZone());

    public static DateTime GetAlertTime(DateTime appointment, AlertLevel alertLevel) =>
        alertLevel switch
        {
            AlertLevel.Early => appointment.AddDays(-1),
            AlertLevel.Standard => appointment.AddHours(-1).AddMinutes(-45),
            AlertLevel.Late => appointment.AddMinutes(-30),
            _ => throw new ArgumentOutOfRangeException(nameof(alertLevel), alertLevel, null)
        };

    public static bool HasDaylightSavingChanged(DateTime dt, Location location)
    {
        var timeZone = location.ToTimeZone();
        var isDaylightSavingTime = timeZone.IsDaylightSavingTime(dt);
        return Enumerable.Range(1, 7).Any(days => isDaylightSavingTime != timeZone.IsDaylightSavingTime(dt.AddDays(-days)));
    }

    public static DateTime NormalizeDateTime(string dtStr, Location location) =>
        DateTime.TryParse(dtStr, location.ToCulture(), DateTimeStyles.AssumeLocal, out var date) ? date : DateTime.MinValue;

    private static TimeZoneInfo ToTimeZone(this Location location) =>
        location switch
        {
            Location.NewYork => TimeZoneInfo.FindSystemTimeZoneById("America/New_York"),
            Location.London => TimeZoneInfo.FindSystemTimeZoneById("Europe/London"),
            Location.Paris => TimeZoneInfo.FindSystemTimeZoneById("Europe/Paris"),
            _ => throw new ArgumentOutOfRangeException(nameof(location), location, null)
        };
    
    private static CultureInfo ToCulture(this Location location) =>
        location switch
        {
            Location.NewYork => CultureInfo.GetCultureInfo("en-US"),
            Location.London => CultureInfo.GetCultureInfo("en-GB"),
            Location.Paris => CultureInfo.GetCultureInfo("fr-FR"),
            _ => throw new ArgumentOutOfRangeException(nameof(location), location, null)
        };
}
