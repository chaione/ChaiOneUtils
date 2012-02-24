//
//  NSArray+CHFunctionalAdditions.h
//  ChaiOneUtils
//
//  Created by Ben Scheirman on 5/23/11.
//  Copyright 2011 ChaiONE. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSArray (CHFunctionalAdditions)

- (NSArray *)ch_collect:(id (^)(id obj))block;
- (NSArray *)ch_select:(BOOL (^)(id obj))block;
- (NSString *)commaSeparatedString;
- (NSString *)stringSeparatedByString:(NSString *)separator;


@end
