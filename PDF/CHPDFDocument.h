//
//  CHPDFDocument.h
//  ChaiOneUtils
//
//  Created by Michael Gile on 2/15/11.
//  Copyright 2011 ChaiOne Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>

#define RELEASE_PDF(ref)		if(ref) { CFRelease(ref); ref = nil; }
#define RELEASE_PAGE(ref)		if(ref) { CFRelease(ref); ref = nil; }

@class UIImage;

/*!
 @class CHPDFDocument
 @discussion A Cocoa wrapper for the PDF utilities provided by the QuartzCore
 framework.
 @updated 15-Feb-2011
 */
@interface CHPDFDocument : NSObject {
@private
	NSURL*					_pdfURL;
	CGPDFDocumentRef		_pdfDocumentRef;
	CGFloat					_pdfScale;
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
@property (nonatomic, assign, readonly) CGPDFDocumentRef CGPDFDocument;

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
- (CGPDFPageRef) pageAtIndex:(NSUInteger)pageIndex;


/*!
 @method rectForPage:withWidth
 @param page
 @param width
 @result A CGRect containing the dimensions for the supplied PDF page within
 the bounds provided by width.
 @discussion
 @updated 15-Feb-2011
 */
- (CGRect) rectForPage:(CGPDFPageRef)page withWidth:(CGFloat)width;


/*!
 @method scaleForPage:withWidth
 @param page
 @param width
 @result The scale factor for the supplied PDF page within the bounds provided
 by width.
 @discussion
 @updated 15-Feb-2011
 */
- (CGFloat) scaleForPage:(CGPDFPageRef)page withWidth:(CGFloat)width;

@end
