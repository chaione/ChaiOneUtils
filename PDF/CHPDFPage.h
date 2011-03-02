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
extern const CGRect kCHDefaultLandscapePageRect;

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
 @property pageNumber
 @result
 @discussion
 @updated 02-Mar-2011
 */
@property (nonatomic, readonly) NSInteger pageNumber;


/*!
 @property isPortrait
 @result YES if page dimensions are 612 x 792 (i.e. Portrait)
 @discussion
 @updated 02-Mar-2011
 */
@property (nonatomic, readonly, getter=isPortrait) BOOL portrait;


/*!
 @property isLandscape
 @result YES if page dimensions are 792 x 612 (i.e. Landscape)
 @discussion
 @updated 02-Mar-2011
 */
@property (nonatomic, readonly, getter=isLandscape) BOOL landscape;


/*!
 @method mediaBoxRect
 @result The CGRect for this PDF pages' Media Box (kCGPDFMediaBox).
 @discussion
 @updated 02-Mar-2011
 */
- (CGRect) mediaBoxRect;


/*!
 @method cropBoxRect
 @result The CGRect for this PDF pages' Crop Box (kCGPDFCropBox).
 @discussion
 @updated 02-Mar-2011
 */
- (CGRect) cropBoxRect;


/*!
 @method trimBoxRect
 @result The CGRect for this PDF pages' Trim Box (kCGPDFTrimBox).
 @discussion
 @updated 02-Mar-2011
 */
- (CGRect) trimBoxRect;


/*!
 @method artBoxRect
 @result The CGRect for this PDF pages' Art Box (kCGPDFArtBox).
 @discussion
 @updated 02-Mar-2011
 */
- (CGRect) artBoxRect;


/*!
 @method bleedBoxRect
 @result The CGRect for this PDF pages' Bleed Box (kCGPDFMBleedBox).
 @discussion
 @updated 02-Mar-2011
 */
- (CGRect) bleedBoxRect;


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
 @method writeToFileAtPath:
 @param filePath
 @result Writes the data for this page to a file.
 @discussion This method is typically used to make loading individual pages of
 a PDF into a UIWebView.
 @updated 20-Feb-2011
 */
- (void) writeToFileAtPath:(NSString*)filePath;

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
