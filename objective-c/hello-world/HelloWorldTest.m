#import <XCTest/XCTest.h>
#import "HelloWorld.h"

@interface test_suite : XCTestCase

@end

@implementation test_suite

- (HelloWorld *)helloWorld {
  return [[HelloWorld alloc] init];
}

- (void)testNoName {
  NSString *input = nil;
  NSString *expected = @"Hello, World!";
  NSString *result = [[self helloWorld] hello:input];
  XCTAssertEqualObjects(expected, result);
}

- (void)testSampleName {
  NSString *input = @"Alice";
  NSString *expected = @"Hello, Alice!";
  NSString *result = [[self helloWorld] hello:input];
  XCTAssertEqualObjects(expected, result);
}
  
- (void)testOtherSampleName {
  NSString *input = @"Bob";
  NSString *expected = @"Hello, Bob!";
  NSString *result = [[self helloWorld] hello:input];
  XCTAssertEqualObjects(expected, result);
}

@end
