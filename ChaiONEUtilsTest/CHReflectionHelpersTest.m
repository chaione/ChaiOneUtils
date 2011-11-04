//
//  CHReflectionHelpersTest.m
//  ChaiOneUtils
//
//  Created by Longyi Qi on 11/4/11.
//  Copyright (c) 2011 ChaiONE Inc. All rights reserved.
//

#import "CHReflectionHelpersTest.h"
#import "CHReflectionHelpers.h"

@implementation CHReflectionHelpersTest

- (void)testUIControlDirectlyDerivedFromUIView {
    STAssertTrue(ch_class_derivesFromClass([UIControl class], [UIView class]), @"UIControl directly derived from UIView");
}

- (void)testUILabelIsAlsoDerivedFromUIView {
    STAssertTrue(ch_class_derivesFromClass([UILabel class], [UIView class]), @"UILabel directly derived from UIView");
}

- (void)testButNSObjectIsNotFromUIView {
    STAssertFalse(ch_class_derivesFromClass([NSObject class], [UIView class]), @"NSObject is not derived from UIView");
}

@end
