//
//  NSString+CHAdditions.m
//  ChaiOneUtils
//
//  Created by Anthony Broussard on 5/27/11.
//  Copyright 2011 ChaiONE. All rights reserved.
//

#import "NSString+CHAdditions.h"
#define ellipsis @"‚Ä¶"

@implementation NSString (CHAdditions)

-(BOOL)isBlank {
	if([[self stringByStrippingWhitespace] length] == 0)
		return YES;
	return NO;
}

-(BOOL)contains:(NSString *)string {
	NSRange range = [self rangeOfString:string];
	return (range.location != NSNotFound);
}

-(NSString *)stringByStrippingWhitespace {
	return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

-(NSArray *)splitOnChar:(char)ch {
	NSMutableArray *results = [[NSMutableArray alloc] init];
	int start = 0;
	for(int i=0; i<[self length]; i++) {
		
		BOOL isAtSplitChar = [self characterAtIndex:i] == ch;
		BOOL isAtEnd = i == [self length] - 1;
        
		if(isAtSplitChar || isAtEnd) {
			//take the substring & add it to the array
			NSRange range;
			range.location = start;
			range.length = i - start + 1;
			
			if(isAtSplitChar)
				range.length -= 1;
			
			[results addObject:[self substringWithRange:range]];
			start = i + 1;
		}
		
		//handle the case where the last character was the split char.  we need an empty trailing element in the array.
		if(isAtEnd && isAtSplitChar)
			[results addObject:@""];
	}
	
	return [results autorelease];
}

-(NSString *)substringFrom:(NSInteger)from to:(NSInteger)to {
	NSString *rightPart = [self substringFromIndex:from];
	return [rightPart substringToIndex:to-from];
}	


/**
 * This method will return NSNotFound as location if the str is not found. 
 */
-(int) indexOfString: (NSString *) str {
	NSRange range = [self rangeOfString:str];
	return range.location;
}


/**
 * This method will return NSNotFound as location if the str is not found. 
 */
-(int) lastIndexOfString:(NSString *) str {
	NSRange range = [self rangeOfString:str options:NSBackwardsSearch];
	return range.location;
}

-(BOOL) equalsIgnoreCase:(NSString *) str {
	if( [self caseInsensitiveCompare:str] == NSOrderedSame ) {
		return YES;
	} else {
		return NO;
	}
}

- (BOOL)startsWithString:(NSString *)prefix {
    NSInteger length = [prefix length];
    NSString *substring = [self substringToIndex:length];
    NSLog(@"substring: %@", substring);
    return [substring isEqualToString:prefix];
}

@end

NSString * EmptyIfNull(NSString * inputString) {
	if (inputString == nil) {
		return @"";
	}
	
	return inputString;
}