/*
 *  CHPDFDocument.h
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
#import <CoreGraphics/CGPDFDocument.h>

#define RETAIN_PDF(ref)			CGPDFDocumentRetain(ref);
#define RELEASE_PDF(ref)		CGPDFDocumentRelease(ref); ref = NULL;


@class UIImage;
@class CHPDFPage;

/*!
 @class CHPDFDocument
 @discussion A Cocoa wrapper for the PDF utilities provided by the CoreGraphics
 framework.
 @updated 15-Feb-2011
 */
@interface CHPDFDocument : NSObject {
@private
	NSURL*					_pdfURL;
	CGPDFDocumentRef		_pdfDocumentRef;
	NSUInteger				_pageCount;
}


/*!
 @property pageCount
 @result The number of pages in the PDF document.
 */
@property (nonatomic, assign, readonly) NSUInteger pageCount;


/*!
 @property CGPDFDocument
 @result A CGPDFDocumentRef for this PDF.
 */
@property (nonatomic, readonly) CGPDFDocumentRef CGPDFDocument;

/*!
 @method pdfDocumentWithFileAtPath:
 @param path
 @result A new CHPDFDocument instance.
 @discussion
 @updated 15-Feb-2011
 */
+ (CHPDFDocument*) pdfDocumentWithFileAtPath:(NSString*)path;


/*!
 @method pdfDocumentWithURL:
 @param url
 @result A new CHPDFDocument instance.
 @discussion
 @updated 15-Feb-2011
 */
+ (CHPDFDocument*) pdfDocumentWithURL:(NSURL*)url;

/*!
 @method initWithFileAtPath:
 @param path
 @result A new CHPDFDocument instance.
 @discussion
 @updated 15-Feb-2011
 */
- (id) initWithFileAtPath:(NSString*)path;

/*!
 @method initWithURL:
 @param url
 @result A new CHPDFDocument instance.
 @discussion
 @updated 15-Feb-2011
 */
- (id) initWithURL:(NSURL*)url;


/*!
 @method imageForPageAtIndex:inRect
 @param pageIndex
 @param pageRect
 @result
 @discussion
 Note: PDF pages start with an index of 1, NOT 0
 @updated 15-Feb-2011
 */
- (UIImage*) imageForPageAtIndex:(NSUInteger)pageIndex inRect:(CGRect)pageRect;


/*!
 @method pageAtIndex:
 @param pageIndex
 @result A CGPDFPageRef for the requested page, or NULL if an invalid page was
 requested. The caller is responsible for calling CFRelease on the returned
 page reference.
 @discussion
	Note: PDF pages start with an index of 1, NOT 0
 @updated 15-Feb-2011
 */
- (CHPDFPage*) pageAtIndex:(NSUInteger)pageIndex;


/*!
 @method dataForPageAtIndex:
 @param pageIndex
 @result An NSData instance containing the raw PDF bytes for the requested page.
 @discussion This method is typically used to make loading individual pages of
 a PDF into a UIWebView.
 @discussion
 Note: PDF pages start with an index of 1, NOT 0
 @updated 18-Feb-2011
 */
- (NSData*) dataForPageAtIndex:(NSUInteger)pageIndex;


@end
