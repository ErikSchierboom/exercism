import ballerina/test;

@test:Config
function EmptyString() {
    test:assertTrue(isIsogram(""));
}

@test:Config {
    enable: false
}
function IsogramWithOnlyLowerCaseCharacters() {
    test:assertTrue(isIsogram("isogram"));
}

@test:Config {
    enable: false
}
function WordWithOneDuplicatedCharacter() {
    test:assertFalse(isIsogram("eleven"));
}

@test:Config {
    enable: false
}
function WordWithOneDuplicatedCharacterFromTheEndOfTheAlphabet() {
    test:assertFalse(isIsogram("zzyzx"));
}

@test:Config {
    enable: false
}
function LongestReportedEnglishIsogram() {
    test:assertTrue(isIsogram("subdermatoglyphic"));
}

@test:Config {
    enable: false
}
function WordWithDuplicatedCharacterInMixedCase() {
    test:assertFalse(isIsogram("Alphabet"));
}

@test:Config {
    enable: false
}
function WordWithDuplicatedCharacterInMixedCaseLowercaseFirst() {
    test:assertFalse(isIsogram("alphAbet"));
}

@test:Config {
    enable: false
}
function HypotheticalIsogrammicWordWithHyphen() {
    test:assertTrue(isIsogram("thumbscrew-japingly"));
}

@test:Config {
    enable: false
}
function HypotheticalWordWithDuplicatedCharacterFollowingHyphen() {
    test:assertFalse(isIsogram("thumbscrew-jappingly"));
}

@test:Config {
    enable: false
}
function IsogramWithDuplicatedHyphen() {
    test:assertTrue(isIsogram("six-year-old"));
}

@test:Config {
    enable: false
}
function MadeUpNameThatIsAnIsogram() {
    test:assertTrue(isIsogram("Emily Jung Schwartzkopf"));
}

@test:Config {
    enable: false
}
function DuplicatedCharacterInTheMiddle() {
    test:assertFalse(isIsogram("accentor"));
}

@test:Config {
    enable: false
}
function SameFirstAndLastCharacters() {
    test:assertFalse(isIsogram("angola"));
}

@test:Config {
    enable: false
}
function WordWithDuplicatedCharacterAndWithTwoHyphens() {
    test:assertFalse(isIsogram("up-to-date"));
}
