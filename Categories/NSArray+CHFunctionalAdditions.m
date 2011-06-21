//
//  NSArray+CHFunctionalAdditions.m
//  ChaiOneUtils
//
//  Created by Ben Scheirman on 5/23/11.
//  Copyright 2011 ChaiONE. All rights reserved.
//

#import "NSArray+CHFunctionalAdditions.h"

@implementation NSArray (CHFunctionalAdditions)

- (NSArray *)ch_collect:(id (^)(id obj))block {
	NSMutableArray *projections = [NSMutableArray arrayWithCapacity:[self count]];
	for (id obj in self) {
		[projections addObject:block(obj)];
	}
	
	return projections;	
}

- (NSArray *)ch_select:(BOOL (^)(id obj))block {
	
	NSMutableArray *subset = [NSMutableArray arrayWithCapacity:[self count]];
	for (id obj in self) {
		if(block(obj)) {
			[subset addObject:obj];
		}
	}
	
	return subset;	
}

- (NSString *)commaSeparatedString {
    NSString *commaFormattedString = @"";
    for (NSString *s in self) {
        commaFormattedString = [NSString stringWithFormat:@"%@%@",commaFormattedString,s];
    }
    return commaFormattedString;
}

@end
