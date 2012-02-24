/*
 *  UIApplication+Logging.h
 *  ChaiOneUtils
 *
 *  Copyright (c) 2011 ChaiOne Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * 
 * http://www.apache.org/licenses/LICENSE-2.0
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 */

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
