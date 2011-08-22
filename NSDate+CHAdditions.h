//
//  NSDate+CHAdditions.h
//  ChaiOneUtils
//
//  Created by Ben Scheirman on 5/26/11.
//  Copyright 2011 ChaiONE. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSDate (CHAdditions)

-(BOOL)isAfterDate:(NSDate *)anotherDate;
-(BOOL)isBeforeDate:(NSDate *)anotherDate;
+ (NSDate *)dateWithDaysFromNow:(NSInteger)days;

@end
