using System;
using System.Globalization;

public static class HighSchoolSweethearts
{
    public static string DisplaySingleLine(string studentA, string studentB)
    {
        const int padding = (61 - 3) / 2;
        return $"{studentA,padding} ♡ {studentB,-padding}";
    }

    public static string DisplayBanner(string studentA, string studentB)
    {
        return $@"******       ******
   **      **   **      **
 **         ** **         **
**            *            **
**                         **
** {studentA, 10} +  {studentB, -9} **
 **                       **
   **                   **
     **               **
       **           **
         **       **
           **   **
             ***
              *";
    }

    public static string DisplayGermanExchangeStudents(string studentA, string studentB, DateTime start, float hours) =>
        string.Format(CultureInfo.GetCultureInfo("de-DE"), "{0} and {1} have been dating since {2:d} - that's {3:N2} hours", studentA, studentB, start.Date, hours);
}
