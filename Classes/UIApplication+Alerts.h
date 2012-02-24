/*
 *  UIApplication+Alerts.h
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
#import <UIKit/UIAlert.h>
#import <UIKit/UIApplication.h>


/*!
 @category UIApplication (CHAlerts)
 */
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