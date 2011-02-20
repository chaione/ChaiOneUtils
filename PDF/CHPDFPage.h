/*
 *  CHPDFPage.h
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
#import <CoreGraphics/CGPDFPage.h>


#define RETAIN_PAGE(ref)		CGPDFPageRetain(ref);
#define RELEASE_PAGE(ref)		CGPDFPageRelease(ref); ref = NULL;

extern const CGRect kCHDefaultPortraitPageRect;

@class UIImage;

@interface CHPDFPage : NSObject {
@private
	CGPDFPageRef	_pageRef;
}

/*!
 @property CGPDFPage
 @result
 @discussion
 @updated 15-Feb-2011
 */
@property (nonatomic, readonly) CGPDFPageRef CGPDFPage;

/*!
 @method imageForRect
 @param rect
 @result
 @discussion
 @updated 15-Feb-2011
 */
+ (CHPDFPage*) pageWithCGPDFPage:(CGPDFPageRef)page;


/*!
 @method imageForRect
 @param rect
 @result
 @discussion
 @updated 15-Feb-2011
 */
- (id) initWithCGPDFPage:(CGPDFPageRef)page;


/*!
 @method imageForRect
 @param rect
 @result
 @discussion
 @updated 15-Feb-2011
 */
- (UIImage*) imageForRect:(CGRect)pageRect;


/*!
 @method data
 @param page
 @result An NSData instance containing the raw PDF bytes for this page.
 @discussion This method is typically used to make loading individual pages of
 a PDF into a UIWebView.
 @updated 18-Feb-2011
 */
- (NSData*) data;


/*!
 @method rectForWidth
 @param page
 @param width
 @result A CGRect containing the dimensions for the PDF page within
 the bounds provided by width.
 @discussion
 @updated 15-Feb-2011
 */
- (CGRect) rectForWidth:(CGFloat)width;


/*!
 @method scaleForPWidth:
 @param page
 @param width
 @result The scale factor for the PDF page within the bounds provided by width.
 @discussion
 @updated 15-Feb-2011
 */
- (CGFloat) scaleForWidth:(CGFloat)width;


@end
