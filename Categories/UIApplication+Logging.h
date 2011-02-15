//
//  UIApplication+Logging.h
//  ChaiOneUtils
//
//  Created by Michael Gile on 2/14/11.
//  Copyright 2011 ChaiOne Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIApplication.h>


/*!
 @category UIApplication (CHLogging)
 */
@interface UIApplication (CHLogging)

/*!
 @method redirectConsoleLogToDocumentFolder:filename
 @param filename
 @discussion
 @updated 14-Feb-2011
 */
+ (void) redirectConsoleLogToDocumentsDirectory:(NSString*)filename;


/*!
 @method pathForConsoleLog:filename
 @param filename
 @result 
 @discussion
 @updated 14-Feb-2011
 */
+ (NSString*) pathForConsoleLog:(NSString*)filename;


/*!
 @method removeConsoleLogFile:filename
 @param filename
 @discussion
 @updated 14-Feb-2011
 */
+ (void) removeConsoleLogFile:(NSString*)filename;



/*!
 @method logFileExists:filename
 @param filename
 @result 
 @discussion
 @updated 14-Feb-2011
 */
+ (BOOL) logFileExists:(NSString*)filename;


/*!
 @method dataForLogFileAtPath:path
 @param path
 @result 
 @discussion
 @updated 14-Feb-2011
 */
+ (NSData*) dataForLogFileAtPath:(NSString*)path;

@end
