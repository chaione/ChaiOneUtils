/*
 *  UIApplication+Alerts.m
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
