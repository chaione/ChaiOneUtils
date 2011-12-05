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

- (NSString *)baseURLString {
    NSString *urlString = [self description];
    NSArray *urlParts = [urlString componentsSeparatedByString:@"?"];
    return [urlParts objectAtIndex:0];
}

- (NSArray *)parameters {
    NSString *urlString = [self description];
    NSArray *urlParts = [urlString componentsSeparatedByString:@"?"];
    if ([urlParts count] > 0) {
        return [[urlParts objectAtIndex:1] splitOnChar:'&'];
    }
    return nil;
}

- (NSDictionary *)paramDictionary {
    NSString *urlString = [self absoluteString];
    NSString *parameterString = [[urlString splitOnChar:'?'] objectAtIndex:1];
    NSArray *paramArray = [parameterString splitOnChar:'&'];
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    for (NSString *paramPair in paramArray) {
        NSArray *pairParts = [paramPair splitOnChar:'='];
        [params setValue:[pairParts objectAtIndex:1] forKey:[pairParts objectAtIndex:0]];
    }
    return params;
}
    

@end
