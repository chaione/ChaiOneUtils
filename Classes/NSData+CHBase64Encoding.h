//
//  NSData+CHBase64Encoding.h
//  ChaiOneUtils
//
//  Created by Ben Scheirman on 7/13/11.
//  Copyright 2011 ChaiONE. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (CHBase64Encoding)

+ (id)dataWithBase64EncodedString:(NSString *)string;     //  Padding '=' characters are optional. Whitespace is ignored.
- (NSString *)base64Encoding;

@end
