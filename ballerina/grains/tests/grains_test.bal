import ballerina/test;

@test:Config
function grainsOnSquare1() {
    test:assertEquals(square(1), 1.0);
}

@test:Config {
    enable: false
}
function grainsOnSquare2() {
    test:assertEquals(square(2), 2.0);
}

@test:Config {
    enable: false
}
function grainsOnSquare3() {
    test:assertEquals(square(3), 4.0);
}

@test:Config {
    enable: false
}
function grainsOnSquare4() {
    test:assertEquals(square(4), 8.0);
}

@test:Config {
    enable: false
}
function grainsOnSquare16() {
    test:assertEquals(square(16), 32768.0);
}

@test:Config {
    enable: false
}
function grainsOnSquare32() {
    test:assertEquals(square(32), 2147483648.0);
}

@test:Config {
    enable: false
}
function grainsOnSquare64() {
    test:assertEquals(square(64), 9223372036854775808.0);
}

@test:Config {
    enable: false
}
function square0RaisesAnException() {
    var rest = square(0);
    if rest is error {
        test:assertEquals(rest.message(), "Invalid square");
    } else {
        test:assertFail("Expected an error");
    }
}

@test:Config {
    enable: false
}
function negativeSquareRaisesAnException() {
    var rest = square(-1);
    if rest is error {
        test:assertEquals(rest.message(), "Invalid square");
    } else {
        test:assertFail("Expected an error");
    }
}

@test:Config {
    enable: false
}
function squareGreaterThan64RaisesAnException() {
    var rest = square(65);
    if rest is error {
        test:assertEquals(rest.message(), "Invalid square");
    } else {
        test:assertFail("Expected an error");
    }
}

@test:Config {
    enable: false
}
function returnsTheTotalNumberOfGrainsOnTheBoard() {
    test:assertEquals(18446744073709551615.0, total());
}
