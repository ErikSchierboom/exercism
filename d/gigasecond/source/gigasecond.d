module gigasecond;

import std.datetime;
import core.time : seconds;

DateTime add(DateTime time)
{
    return time + seconds(1_000_000_000);
}

unittest
{
    // Date only specification of time
    assert(add(DateTime(2011, 4, 25)) == DateTime(2043, 1, 1, 1, 46, 40));

    // Second test for date only specification of time"
    assert(add(DateTime(1977, 6, 13)) == DateTime(2009, 2, 19, 1, 46, 40));

    // Third test for date only specification of time
    assert(add(DateTime(1959, 7, 19)) == DateTime(1991, 3, 27, 1, 46, 40));

    // Full time specified
    assert(add(DateTime(2015, 1, 24, 22, 0, 0)) == DateTime(2046, 10, 2, 23, 46, 40));

    // Full time with day roll-over
    assert(add(DateTime(2015, 1, 24, 23, 59, 59)) == DateTime(2046, 10, 3, 1, 46, 39));

    // Check that it doesn't mutate the argument
    auto d = DateTime(2011, 4, 25);
    assert(add(d) == DateTime(2043, 1, 1, 1, 46, 40));
    assert(d == DateTime(2011, 4, 25));
}
