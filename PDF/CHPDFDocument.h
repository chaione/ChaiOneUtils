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
 @class
 @discussion
 @updated
 */
@interface CHPDFDocument : NSObject {

@private
	NSURL*					_pdfURL;
	CGPDFDocumentRef		_pdfDocumentRef;
	CGFloat					_pdfScale;
	NSUInteger				_pageCount;
}

@property (nonatomic, assign) NSUInteger pageCount;
@property (nonatomic, assign) CGPDFDocumentRef CGPDFDocument;

/*!
 @method
 @param
 @result
 @discussion
 @updated
 */
+ (CHPDFDocument*) pdfDocumentWithFileAtPath:(NSString*)path;


/*!
 @method
 @param
 @result
 @discussion
 @updated
 */
+ (CHPDFDocument*) pdfDocumentWithURL:(NSURL*)url;

/*!
 @method
 @param
 @result
 @discussion
 @updated
 */
- (id) initWithFileAtPath:(NSString*)path;

/*!
 @method
 @param
 @result
 @discussion
 @updated
 */
- (id) initWithURL:(NSURL*)url;


/*!
 @method
 @param
 @result
 @discussion
 Note: PDF pages start with an index of 1, NOT 0
 @updated
 */
- (UIImage*) imageForPageAtIndex:(NSUInteger)pageIndex inRect:(CGRect)pageRect;


/*!
 @method
 @param
 @result
 @discussion
	Note: PDF pages start with an index of 1, NOT 0
 @updated
 */
- (CGPDFPageRef) pageAtIndex:(NSUInteger)pageIndex;


/*!
 @method
 @param
 @result
 @discussion
 @updated
 */
- (CGRect) rectForPage:(CGPDFPageRef)page withWidth:(CGFloat)width;


/*!
 @method
 @param
 @result
 @discussion
 @updated
 */
- (CGFloat) scaleForPage:(CGPDFPageRef)page withWidth:(CGFloat)width;

@end
