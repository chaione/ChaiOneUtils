//
//  UIApplication+Logging.h
//  ChaiOneUtils
//
//  Created by Michael Gile on 2/14/11.
//  Copyright 2011 ChaiOne Inc. All rights reserved.
//

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
