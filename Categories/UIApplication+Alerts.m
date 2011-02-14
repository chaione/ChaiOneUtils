//
//  UIApplication+Alerts.m
//  ChaiOneUtils
//
//  Created by Michael Gile on 2/14/11.
//  Copyright 2011 ChaiOne Inc. All rights reserved.
//

#import "UIApplication+Alerts.h"


@implementation UIApplication (CHAlerts)

+ (void) showNSErrorAlert:(NSError*)error {
	UIAlertView* alert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"iPhone Error", @"iPhone Error")
													message:error.localizedDescription 
												   delegate:nil 
										  cancelButtonTitle:NSLocalizedString(@"Dismiss", @"Dismiss")
										  otherButtonTitles:nil];
	
	[alert show];	
	[alert release];
}


+ (void) showErrorMessage:(NSString*)message {
	UIAlertView* errorAlert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"ERROR", @"ERROR")
														 message:message 
														delegate:nil 
											   cancelButtonTitle:NSLocalizedString(@"Dismiss", @"Dismiss")
											   otherButtonTitles:nil];
	
	[errorAlert show];
	[errorAlert release];
}


+ (void) showInfoMessage:(NSString*)message {
	UIAlertView* errorAlert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Info", @"Info")
														 message:message 
														delegate:nil 
											   cancelButtonTitle:NSLocalizedString(@"Dismiss", @"Dismiss")
											   otherButtonTitles:nil];
	
	[errorAlert show];	
	[errorAlert release];
}


+ (void) showSuccessMessage:(NSString*)message {
	UIAlertView* errorAlert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Success", @"Success")
														 message:message 
														delegate:nil 
											   cancelButtonTitle:NSLocalizedString(@"Dismiss", @"Dismiss")
											   otherButtonTitles:nil];
	
	[errorAlert show];	
	[errorAlert release];
}


@end
