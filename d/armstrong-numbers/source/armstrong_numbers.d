module armstrong_numbers;

import std.conv : to;
import std.range : walkLength;
import std.algorithm : map, sum;

@safe pure bool isArmstrongNumber(uint number)
{
    auto digits = number.to!(string)
        .map!(c => c - '0');
    auto numDigits = digits.walkLength;

    return number == digits.map!(d => d ^^ numDigits).sum;
}

unittest
{
    // Zero is an Armstrong number
    assert(isArmstrongNumber(0));

    // Single digit numbers are Armstrong numbers
    assert(isArmstrongNumber(5));

    // There are no 2 digit Armstrong numbers
    assert(!isArmstrongNumber(10));

    // Three digit number that is an Armstrong number
    assert(isArmstrongNumber(153));

    // Three digit number that is not an Armstrong number
    assert(!isArmstrongNumber(100));

    // Four digit number that is an Armstrong number
    assert(isArmstrongNumber(9474));

    // Four digit number that is not an Armstrong number
    assert(!isArmstrongNumber(9475));

    // Seven digit number that is an Armstrong number
    assert(isArmstrongNumber(9926315));

    // Seven digit number that is not an Armstrong number
    assert(!isArmstrongNumber(9926314));
}
