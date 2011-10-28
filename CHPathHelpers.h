//
//  CHPathHelpers.h
//  ChaiOneUtils
//
//  Created by Ben Scheirman on 5/31/11.
//  Copyright 2011 ChaiONE. All rights reserved.
//

#import <Foundation/Foundation.h>


NSString *PathForFileInDocumentsDirectory(NSString *filepath);
NSString *DocumentsDirectory();

NSURL *URLForFileInDocumentDirectory(NSString *filepath);
NSURL *DocumentsDirectoryURL();
