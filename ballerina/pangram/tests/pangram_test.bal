import ballerina/test;

@test:Config
function emptySentence() {
    test:assertFalse(isPangram(""));
}

@test:Config {
    enable: false
}
function perfectLowerCase() {
    test:assertTrue(isPangram("abcdefghijklmnopqrstuvwxyz"));
}

@test:Config {
    enable: false
}
function onlyLowerCase() {
    test:assertTrue(isPangram("the quick brown fox jumps over the lazy dog"));
}

@test:Config {
    enable: false
}
function missingTheLetterX() {
    test:assertFalse(isPangram("a quick movement of the enemy will jeopardize five gunboats"));
}

@test:Config {
    enable: false
}
function missingTheLetterH() {
    test:assertFalse(isPangram("five boxing wizards jump quickly at it"));
}

@test:Config {
    enable: false
}
function withUnderscores() {
    test:assertTrue(isPangram("theQuickBrownFoxJumpsOverTheLazyDog"));
}

@test:Config {
    enable: false
}
function withNumbers() {
    test:assertTrue(isPangram("the 1 quick brown fox jumps over the 2 lazy dogs"));
}

@test:Config {
    enable: false
}
function missingLettersReplacedByNumbers() {
    test:assertFalse(isPangram("7h3 qu1ck brown fox jumps ov3r 7h3 lazy dog"));
}

@test:Config {
    enable: false
}
function mixedCaseAndPunctuation() {
    test:assertTrue(isPangram("\"Five quacking Zephyrs jolt my wax bed.\""));
}

@test:Config {
    enable: false
}
function aMAndAMAre_26DifferentCharactersButNotAPangram() {
    test:assertFalse(isPangram("abcdefghijklm ABCDEFGHIJKLM"));
}
