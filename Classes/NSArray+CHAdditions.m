//
//  NSArray+CHAdditions.m
//  ChaiOneUtils
//
//  Created by Ben Scheirman on 12/5/11.
//  Copyright (c) 2011 ChaiONE. All rights reserved.
//

#import "NSArray+CHAdditions.h"

@implementation NSArray (CHAdditions)

- (id)firstObject {
    if ([self count] == 0) {
        return nil;
    }
    
    return [self objectAtIndex:0];
}

@end
