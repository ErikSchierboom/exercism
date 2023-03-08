module leap;

bool isLeap(int year)
{
    return year % 4 == 0 && (year % 100 != 0 || year % 400 == 0);
}

unittest
{
    immutable int allTestsEnabled = 0;

    // Year not divisible by 4 in common year
    assert(!isLeap(2015));

    static if (allTestsEnabled)
    {
        // Year divisible by 2, not divisible by 4 in common year
        assert(!isLeap(1970));

        // Year divisible by 4, not divisible by 100 in leap year
        assert(isLeap(1996));

        // Year divisible by 4 and 5 is still a leap year
        assert(isLeap(1960));

        // Year divisible by 100, not divisible by 400 in common year
        assert(!isLeap(2100));

        // Year divisible by 100 but not by 3 is still not a leap year
        assert(!isLeap(1900));

        // Year divisible by 400 in leap year
        assert(isLeap(2000));

        // Year divisible by 400 but not by 125 is still a leap year
        assert(isLeap(2400));

        // Year divisible by 200, not divisible by 400 in common year
        assert(!isLeap(1800));
    }
}
