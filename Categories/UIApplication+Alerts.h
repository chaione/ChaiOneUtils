//
//  UIApplication+Alerts.h
//  ChaiOneUtils
//
//  Created by Michael Gile on 2/14/11.
//  Copyright 2011 ChaiOne Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIAlert.h>
#import <UIKit/UIApplication.h>


@interface UIApplication (CHAlerts)


/*!
 @method showNSErrorAlert:error
 @param error
 @discussion
 @updated 14-Feb-2011
 */
+ (void) showNSErrorAlert:(NSError*)error;


/*!
 @method showErrorMessage:message
 @param message
 @discussion
 @updated 14-Feb-2011
 */
+ (void) showErrorMessage:(NSString*)message;


/*!
 @method showInfoMessage:message
 @param message
 @discussion
 @updated 14-Feb-2011
 */
+ (void) showInfoMessage:(NSString*)message;


/*!
 @method showSuccessMessage:message
 @param message
 @discussion
 @updated 14-Feb-2011
 */
+ (void) showSuccessMessage:(NSString*)message;

@end