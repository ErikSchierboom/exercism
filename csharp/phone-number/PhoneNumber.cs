﻿using System;
using System.Text.RegularExpressions;

public static class PhoneNumber
{
    public static string Clean(string phoneNumber)
    {
        var match = Regex.Match(phoneNumber, @"^[^\d]*?1?[^\d]*?([2-9]\d{2})[^\d]*?([2-9]\d{2})[^\d]*?(\d{4})[^\d]*$");
        if (!match.Success)
            throw new ArgumentException("Invalid phone number", nameof(phoneNumber));

        return $"{match.Groups[1].Value}{match.Groups[2].Value}{match.Groups[3].Value}";
    }
}