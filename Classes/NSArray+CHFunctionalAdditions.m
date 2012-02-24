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

- (NSString *)stringSeparatedByString:(NSString *)separator {
    NSString *separatedString = @"";
    for (NSString *s in self) {
        if ([separatedString isEqualToString:@""]) {
            separatedString = s;
        } else {
            separatedString = [NSString stringWithFormat:@"%@%@%@",separatedString,separator,s];
        }
    }
    return separatedString;
}

- (NSString *)commaSeparatedString {
    return [self stringSeparatedByString:@","];           
}

@end
