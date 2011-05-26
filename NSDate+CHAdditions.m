//
//  NSDate+CHAdditions.m
//  ChaiOneUtils
//
//  Created by Ben Scheirman on 5/26/11.
//  Copyright 2011 ChaiONE. All rights reserved.
//

#import "NSDate+CHAdditions.h"


@implementation NSDate (CHAdditions)

+ (NSDate *)dateWithDaysFromNow:(NSInteger)days {
    const NSTimeInterval dayInterval = 60 * 60 * 24;
    return [NSDate dateWithTimeIntervalSinceNow:dayInterval * days];
}

@end
