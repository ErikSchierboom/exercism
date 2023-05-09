import ballerina/test;

@test:Config
function testHello() {
    test:assertEquals("Hello, World!", hello());
}
