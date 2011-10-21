//
//  CHPathHelpers.m
//  ChaiOneUtils
//
//  Created by Ben Scheirman on 5/31/11.
//  Copyright 2011 ChaiONE. All rights reserved.
//

#import "CHPathHelpers.h"

NSString *PathForFileInDocumentsDirectory(NSString *filepath) {
    return [DocumentsDirectory() stringByAppendingPathComponent:filepath];
}

NSString * DocumentsDirectory() {
    NSString *docsDir = nil;
    NSArray *directories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    if ([directories count] > 0)
        docsDir = [directories objectAtIndex:0];
    
    if(!docsDir) {
        [NSException raise:@"Critical Error" format:@"Can't find documents directory!"];
    }
    
    return docsDir;
}

NSURL *URLForFileInDocumentDirectory(NSString *filepath) {
    return [DocumentsDictionaryURL() URLByAppendingPathComponent:filepath];
}

NSURL *DocumentsDictionaryURL() {
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}
