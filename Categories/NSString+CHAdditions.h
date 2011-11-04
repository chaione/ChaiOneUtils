//
//  NSString+CHAdditions.h
//  ChaiOneUtils
//
//  Created by Anthony Broussard on 5/27/11.
//  Copyright 2011 ChaiONE. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CHStringHelpers.h"

@interface NSString (CHAdditions)

- (BOOL)isBlank;
- (BOOL)contains:(NSString *)string;
- (NSArray *)splitOnChar:(char)ch;
- (NSString *)substringFrom:(NSInteger)from to:(NSInteger)to;
- (NSString *)stringByStrippingWhitespace;
- (int)indexOfString: (NSString *)str;
- (int)lastIndexOfString:(NSString *)str;
- (BOOL)equalsIgnoreCase:(NSString *)str;
- (BOOL)startsWithString:(NSString *)prefix;
- (NSString *)uriEscapedString;

@end