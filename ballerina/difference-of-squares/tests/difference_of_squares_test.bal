import ballerina/test;

@test:Config
function squareOfSum_1() {
    test:assertEquals(squareOfSum(1), 1);
}

@test:Config {
    enable: false
}
function squareOfSum_5() {
    test:assertEquals(squareOfSum(5), 225);
}

@test:Config {
    enable: false
}
function squareOfSum_100() {
    test:assertEquals(squareOfSum(100), 25502500);
}

@test:Config {
    enable: false
}
function sumOfSquares_1() {
    test:assertEquals(sumOfSquares(1), 1);
}

@test:Config {
    enable: false
}
function sumOfSquares_5() {
    test:assertEquals(sumOfSquares(5), 55);
}

@test:Config {
    enable: false
}
function sumOfSquares_100() {
    test:assertEquals(sumOfSquares(100), 338350);
}

@test:Config {
    enable: false
}
function differenceOfSquares_1() {
    test:assertEquals(differenceOfSquares(1), 0);
}

@test:Config {
    enable: false
}
function differenceOfSquares_5() {
    test:assertEquals(differenceOfSquares(5), 170);
}

@test:Config {
    enable: false
}
function differenceOfSquares_100() {
    test:assertEquals(differenceOfSquares(100), 25164150);
}
