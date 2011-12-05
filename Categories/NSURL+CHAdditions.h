//
//  NSURL+CHAdditions.h
//  ChaiOneUtils
//
//  Created by Anthony Broussard on 7/13/11.
//  Copyright 2011 ChaiONE. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSURL (CHAdditions)

- (NSString *)baseURLString;
- (NSArray *)parameters;
- (NSDictionary *)paramDictionary;

@end
