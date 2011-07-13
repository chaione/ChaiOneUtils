//
//  NSURL+CHAdditions.m
//  ChaiOneUtils
//
//  Created by Anthony Broussard on 7/13/11.
//  Copyright 2011 ChaiONE. All rights reserved.
//

#import "NSURL+CHAdditions.h"
#import "NSArray+CHFunctionalAdditions.h"
#import "NSString+CHAdditions.h"

@implementation NSURL (CHAdditions)

- (NSString *)baseURL {
    NSString *urlString = [self description];
    
    NSArray *urlParts = [urlString componentsSeparatedByString:@"?"];
    return [urlParts objectAtIndex:0];
}

- (NSArray *)parameters {
    NSString *urlString = [self description];
    
    NSArray *urlParts = [urlString componentsSeparatedByString:@"?"];
    
    NSArray *params = [[urlParts objectAtIndex:1] splitOnChar:'&'];
    NSLog(@"params: %@",params);
    return params;
}

@end
