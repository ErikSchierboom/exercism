#!/usr/bin/env perl
use Test2::V0;

use FindBin qw<$Bin>;
use lib "$Bin/../lib", "$Bin/../local/lib/perl5"; # Find modules in the same dir as this file.

use HelloWorld qw<hello>;

# Run the 'is' sub from 'Test2::V0' with three arguments. # begin: af9ffe10-dc13-42d8-a742-e7bdafac449d
is(
    hello(), # Run the 'hello' sub imported from the module.
    "Hello, World!", # The expected result to compare with 'hello'.
    "Say Hi!" # The test description.
); # end: af9ffe10-dc13-42d8-a742-e7bdafac449d

done_testing;
