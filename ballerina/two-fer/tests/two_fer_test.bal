import ballerina/test;

@test:Config
function noNameGiven() {
    test:assertEquals(speak(()), "One for you, one for me.");
}

@test:Config {
    enable: false
}
function aNameGiven() {
    test:assertEquals(speak("Alice"), "One for Alice, one for me.");
}

@test:Config {
    enable: false
}
function anotherNameGiven() {
    test:assertEquals(speak("Bob"), "One for Bob, one for me.");
}
