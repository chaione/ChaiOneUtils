//
//  CHStringHelpersTest.m
//  ChaiOneUtils
//
//  Created by Longyi Qi on 11/4/11.
//  Copyright (c) 2011 ChaiONE Inc. All rights reserved.
//

#import "CHStringHelpersTest.h"
#import "CHStringHelpers.h"

@implementation CHStringHelpersTest

- (void)testEmptyIfNullWithNSString {
    STAssertEqualObjects(@"f0_0bar", EmptyIfNull(@"f0_0bar"), @"a string with characters will keep the same");
}

- (void)testEmptyIfNullWithNil {
    STAssertEqualObjects(@"", EmptyIfNull(nil), @"nil string should be converted to \"\"");
}

@end
