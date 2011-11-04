//
//  NSArray+CHFunctionalAdditions.h
//  ChaiOneUtils
//
//  Created by Ben Scheirman on 5/23/11.
//  Copyright 2011 ChaiONE. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSArray (CHFunctionalAdditions)

- (NSArray *)collect:(id (^)(id obj))block;
- (NSArray *)map:(id (^)(id obj))block;
- (NSArray *)select:(BOOL (^)(id obj))block;
- (NSString *)commaSeparatedString;
- (NSString *)stringSeparatedByString:(NSString *)separator;

- (NSArray *)ch_collect:(id (^)(id obj))block __attribute__ ((deprecated));
- (NSArray *)ch_select:(BOOL (^)(id obj))block __attribute__ ((deprecated));

@end
