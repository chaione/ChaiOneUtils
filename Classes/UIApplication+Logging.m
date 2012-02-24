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

#import "UIApplication+Logging.h"
#import "CHLogging.h"


@implementation UIApplication (CHLogging)

+ (void) redirectConsoleLogToDocumentsDirectory:(NSString*)filename {
	NSArray* paths					= NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString* documentsDirectory	= [paths objectAtIndex:0];
	NSString* logPath				= [documentsDirectory stringByAppendingPathComponent:filename];
	
	freopen([logPath cStringUsingEncoding:NSASCIIStringEncoding],"a+",stderr);
}



+ (NSString*) pathForConsoleLog:(NSString*)filename {
	NSArray* paths					= NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString* documentsDirectory	= [paths objectAtIndex:0];
	NSString* logPath				= [documentsDirectory stringByAppendingPathComponent:filename];
	
	return logPath;
}

+ (void) removeConsoleLogFile:(NSString*)filename {
	@try {		
		fclose(stderr);
		
		NSError* error				= nil;
		[[NSFileManager defaultManager] removeItemAtPath:[UIApplication pathForConsoleLog:filename] error:&error];
		CHNSERROR(error)
	}
	@catch (NSException * e) {
		CHEXCEPTION(e)
	}
}

+ (BOOL) logFileExists:(NSString*)filename {
	
	NSString* logFilePath			= [UIApplication pathForConsoleLog:filename];
	if (logFilePath) {
		return [[NSFileManager defaultManager] fileExistsAtPath:logFilePath];
	}
	
	return NO;
}

+ (NSData*) dataForLogFileAtPath:(NSString*)path {
	return [NSData dataWithContentsOfFile:path];
}

@end
