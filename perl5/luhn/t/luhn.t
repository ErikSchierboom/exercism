#!/usr/bin/env perl
use Test2::V0;

use FindBin qw<$Bin>;
use lib "$Bin/../lib", "$Bin/../local/lib/perl5";

use Luhn qw<is_luhn_valid>;

is( # begin: 792a7082-feb7-48c7-b88b-bbfec160865e
    is_luhn_valid("1"),
    DF, # Defined but False
    "single digit strings can not be valid",
); # end: 792a7082-feb7-48c7-b88b-bbfec160865e

is( # begin: 698a7924-64d4-4d89-8daa-32e1aadc271e
    is_luhn_valid("0"),
    DF, # Defined but False
    "a single zero is invalid",
); # end: 698a7924-64d4-4d89-8daa-32e1aadc271e

is( # begin: 73c2f62b-9b10-4c9f-9a04-83cee7367965
    is_luhn_valid("059"),
    T, # True
    "a simple valid SIN that remains valid if reversed",
); # end: 73c2f62b-9b10-4c9f-9a04-83cee7367965

is( # begin: 9369092e-b095-439f-948d-498bd076be11
    is_luhn_valid("59"),
    T, # True
    "a simple valid SIN that becomes invalid if reversed",
); # end: 9369092e-b095-439f-948d-498bd076be11

is( # begin: 8f9f2350-1faf-4008-ba84-85cbb93ffeca
    is_luhn_valid("055 444 285"),
    T, # True
    "a valid Canadian SIN",
); # end: 8f9f2350-1faf-4008-ba84-85cbb93ffeca

is( # begin: 1cdcf269-6560-44fc-91f6-5819a7548737
    is_luhn_valid("055 444 286"),
    DF, # Defined but False
    "invalid Canadian SIN",
); # end: 1cdcf269-6560-44fc-91f6-5819a7548737

is( # begin: 656c48c1-34e8-4e60-9a5a-aad8a367810a
    is_luhn_valid("8273 1232 7352 0569"),
    DF, # Defined but False
    "invalid credit card",
); # end: 656c48c1-34e8-4e60-9a5a-aad8a367810a

is( # begin: 20e67fad-2121-43ed-99a8-14b5b856adb9
    is_luhn_valid("1 2345 6789 1234 5678 9012"),
    DF, # Defined but False
    "invalid long number with an even remainder",
); # end: 20e67fad-2121-43ed-99a8-14b5b856adb9

is( # begin: 7e7c9fc1-d994-457c-811e-d390d52fba5e
    is_luhn_valid("1 2345 6789 1234 5678 9013"),
    DF, # Defined but False
    "invalid long number with a remainder divisible by 5",
); # end: 7e7c9fc1-d994-457c-811e-d390d52fba5e

is( # begin: ad2a0c5f-84ed-4e5b-95da-6011d6f4f0aa
    is_luhn_valid("095 245 88"),
    T, # True
    "valid number with an even number of digits",
); # end: ad2a0c5f-84ed-4e5b-95da-6011d6f4f0aa

is( # begin: ef081c06-a41f-4761-8492-385e13c8202d
    is_luhn_valid("234 567 891 234"),
    T, # True
    "valid number with an odd number of spaces",
); # end: ef081c06-a41f-4761-8492-385e13c8202d

is( # begin: bef66f64-6100-4cbb-8f94-4c9713c5e5b2
    is_luhn_valid("059a"),
    DF, # Defined but False
    "valid strings with a non-digit added at the end become invalid",
); # end: bef66f64-6100-4cbb-8f94-4c9713c5e5b2

is( # begin: 2177e225-9ce7-40f6-b55d-fa420e62938e
    is_luhn_valid("055-444-285"),
    DF, # Defined but False
    "valid strings with punctuation included become invalid",
); # end: 2177e225-9ce7-40f6-b55d-fa420e62938e

is( # begin: ebf04f27-9698-45e1-9afe-7e0851d0fe8d
    is_luhn_valid("055# 444\$ 285"),
    DF, # Defined but False
    "valid strings with symbols included become invalid",
); # end: ebf04f27-9698-45e1-9afe-7e0851d0fe8d

is( # begin: 08195c5e-ce7f-422c-a5eb-3e45fece68ba
    is_luhn_valid(" 0"),
    DF, # Defined but False
    "single zero with space is invalid",
); # end: 08195c5e-ce7f-422c-a5eb-3e45fece68ba

is( # begin: 12e63a3c-f866-4a79-8c14-b359fc386091
    is_luhn_valid("0000 0"),
    T, # True
    "more than a single zero is valid",
); # end: 12e63a3c-f866-4a79-8c14-b359fc386091

is( # begin: ab56fa80-5de8-4735-8a4a-14dae588663e
    is_luhn_valid("091"),
    T, # True
    "input digit 9 is correctly converted to output digit 9",
); # end: ab56fa80-5de8-4735-8a4a-14dae588663e

is( # begin: b9887ee8-8337-46c5-bc45-3bcab51bc36f
    is_luhn_valid("9999999999 9999999999 9999999999 9999999999"),
    T, # True
    "very long input is valid",
); # end: b9887ee8-8337-46c5-bc45-3bcab51bc36f

is( # begin: 8a7c0e24-85ea-4154-9cf1-c2db90eabc08
    is_luhn_valid("109"),
    T, # True
    "valid luhn with an odd number of digits and non zero first digit",
); # end: 8a7c0e24-85ea-4154-9cf1-c2db90eabc08

is( # begin: 39a06a5a-5bad-4e0f-b215-b042d46209b1
    is_luhn_valid("055b 444 285"),
    DF, # Defined but False
    "using ascii value for non-doubled non-digit isn't allowed",
); # end: 39a06a5a-5bad-4e0f-b215-b042d46209b1

is( # begin: f94cf191-a62f-4868-bc72-7253114aa157
    is_luhn_valid(":9"),
    DF, # Defined but False
    "using ascii value for doubled non-digit isn't allowed",
); # end: f94cf191-a62f-4868-bc72-7253114aa157

is( # begin: 8b72ad26-c8be-49a2-b99c-bcc3bf631b33
    is_luhn_valid("59%59"),
    DF, # Defined but False
    "non-numeric, non-space char in the middle with a sum that's divisible by 10 isn't allowed",
); # end: 8b72ad26-c8be-49a2-b99c-bcc3bf631b33

done_testing;
