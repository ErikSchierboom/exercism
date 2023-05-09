import ballerina/test;

@test:Config
function yearNotDivisibleBy4InCommonYear() {
    test:assertFalse(isLeapYear(2015));
}

@test:Config {
    enable: false
}
function yearDivisibleBy2NotDivisibleBy4InCommonYear() {
    test:assertFalse(isLeapYear(1970));
}

@test:Config {
    enable: false
}
function yearDivisibleBy4NotDivisibleBy100InLeapYear() {
    test:assertTrue(isLeapYear(1996));
}

@test:Config {
    enable: false
}
function yearDivisibleBy4And5IsStillALeapYear() {
    test:assertTrue(isLeapYear(1960));
}

@test:Config {
    enable: false
}
function yearDivisibleBy100NotDivisibleBy400InCommonYear() {
    test:assertFalse(isLeapYear(2100));
}

@test:Config {
    enable: false
}
function yearDivisibleBy100ButNotBy3IsStillNotALeapYear() {
    test:assertFalse(isLeapYear(1900));
}

@test:Config {
    enable: false
}
function yearDivisibleBy400IsLeapYear() {
    test:assertTrue(isLeapYear(2000));
}

@test:Config {
    enable: false
}
function yearDivisibleBy400ButNotBy125IsStillALeapYear() {
    test:assertTrue(isLeapYear(2400));
}

@test:Config {
    enable: false
}
function yearDivisibleBy200NotDivisibleBy400InCommonYear() {
    test:assertFalse(isLeapYear(1800));
}
