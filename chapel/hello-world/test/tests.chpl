use UnitTest;

use HelloWorld;

proc testHelloWorld(test : borrowed Test) throws {
  test.assertEqual(hello(), "Hello, World!");
}

UnitTest.main();
