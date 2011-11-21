//
//  CHStringHelpers.m
//  ChaiOneUtils
//
//  Created by Longyi Qi on 11/4/11.
//  Copyright (c) 2011 ChaiONE Inc. All rights reserved.
//

#import "CHStringHelpers.h"

NSString * EmptyIfNull(NSString * inputString) {
    return inputString == nil ? @"" : inputString;
}