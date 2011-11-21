//
//  NSArrayCHAdditionsTest.m
//  ChaiOneUtils
//
//  Created by Longyi Qi on 11/4/11.
//  Copyright (c) 2011 ChaiONE Inc. All rights reserved.
//

#import "NSArrayCHAdditionsTest.h"
#import "NSArray+CHFunctionalAdditions.h"

@implementation NSArrayCHAdditionsTest

- (void)testMap {
    NSArray *anArray = [NSArray arrayWithObjects:@"1", @"2", @"3", nil];
    NSArray *testArray = [anArray map:^(NSString *e) {
        return [NSString stringWithFormat:@"%@test", e];
    }];
    STAssertEqualObjects(@"1test", [testArray objectAtIndex:0], @"first element after mapping should be 1test");
    STAssertEqualObjects(@"2test", [testArray objectAtIndex:1], @"second element after mapping should be 2test");
    STAssertEqualObjects(@"3test", [testArray objectAtIndex:2], @"second element after mapping should be 3test");
}

- (void)testSelect {
    NSArray *anArray = [NSArray arrayWithObjects:@"1", @"2", @"3", nil];
    NSArray *testArray = [anArray select:^BOOL (NSString *e) {
        return [e intValue] < 3;
    }];
    STAssertEquals(2, (int)[testArray count], @"new array should has 2 items, but it has %d items", [testArray count]);
    STAssertEqualObjects(@"1", [testArray objectAtIndex:0], @"first element after mapping should be 1");
    STAssertEqualObjects(@"2", [testArray objectAtIndex:1], @"second element after mapping should be 2");
}

- (void)testJoin {
    NSArray *anArray = [NSArray arrayWithObjects:@"1", @"2", @"3", nil];
    NSString *testString = [anArray componentsJoinedByString:@"+"];
    STAssertEqualObjects(@"1+2+3", testString, @"new string should be 1+2+3");
}

@end
