//
//  CHPDFDocument.m
//  ChaiOneUtils
//
//  Created by Michael Gile on 2/15/11.
//  Copyright 2011 ChaiOne Inc. All rights reserved.
//

#import "CHPDFDocument.h"
#import <UIKit/UIGraphics.h>
#import <UIKit/UIImage.h>
#import "CHLogging.h"


// An 8.5" x 11" page
const CGRect kCHDefaultPortraitPageRect	= {
	// Origin (x,y)
	{ 0.0f, 0.0f },
	// Size (w,h)
	{ 612.0f, 792.0f }
};


@interface CHPDFDocument (Private)
- (void) loadPDF;
@end


#pragma mark -
@implementation CHPDFDocument

#pragma mark -
#pragma mark Properties

@synthesize pageCount		= _pageCount;
@synthesize CGPDFDocument	= _pdfDocumentRef;

- (CGPDFDocumentRef) CGPDFDocument {
	if (!_pdfDocumentRef) {
		[self loadPDF];
	}
	
	return _pdfDocumentRef;
}

#pragma mark -
#pragma mark Memory Management

- (void) dealloc {
	[_pdfURL release];
	RELEASE_PDF(_pdfDocumentRef)
	[super dealloc];
}

- (id) initWithFileAtPath:(NSString*)path {
	if (self = [super init]) {
		_pdfURL		= [[NSURL fileURLWithPath:path] retain];
	}
	
	return self;
}


- (id) initWithURL:(NSURL*)url {
	if (self = [super init]) {
		_pdfURL		= [url retain];
	}
	
	return self;
}

#pragma mark -
#pragma mark Static Methods

+ (CHPDFDocument*) pdfDocumentWithFileAtPath:(NSString*)path {
	return [[[CHPDFDocument alloc] initWithFileAtPath:path] autorelease];
}


+ (CHPDFDocument*) pdfDocumentWithURL:(NSURL*)url {
	return [[[CHPDFDocument alloc] initWithURL:url] autorelease];
}

#pragma mark -
#pragma mark Public Methods

- (UIImage*) imageForPageAtIndex:(NSUInteger)pageIndex 
						  inRect:(CGRect)pageRect {

	UIGraphicsBeginImageContext(pageRect.size);
	
	UIImage* thumbnail			= nil;
	CGPDFPageRef page			= [self pageAtIndex:pageIndex];
	RETAIN_PAGE(page)
	CGFloat pdfScale			= [self scaleForPage:page withWidth:pageRect.size.width];
	
	@try {
		CGContextRef context	= UIGraphicsGetCurrentContext();
		
		// First fill the background with white.
		CGContextSetRGBFillColor(context, 1.0f, 1.0f, 1.0f, 1.0f);
		CGContextFillRect(context, pageRect);
		
		CGContextSaveGState(context);
		// Flip the context so that the PDF page is rendered
		// right side up.
		CGContextTranslateCTM(context, 0.0, pageRect.size.height);
		CGContextScaleCTM(context, 1.0, -1.0);
		
		// Scale the context so that the PDF page is rendered 
		// at the correct size for the zoom level.
		CGContextScaleCTM(context, pdfScale, pdfScale);	
		CGContextDrawPDFPage(context, page);
		CGContextRestoreGState(context);
		
		thumbnail				= UIGraphicsGetImageFromCurrentImageContext();
		
		UIGraphicsEndImageContext();
	}
	@catch (NSException * e) {
		CHEXCEPTION(e)
	}
	@finally {
		RELEASE_PAGE(page)
	}
	
	return thumbnail;
}

- (CGPDFPageRef) pageAtIndex:(NSUInteger)pageIndex {
	CGPDFPageRef page		= CGPDFDocumentGetPage([self CGPDFDocument], pageIndex);
	return page;
}

- (CGFloat) scaleForPage:(CGPDFPageRef)page withWidth:(CGFloat)width {
	
	if (NULL == page) {
		return 0.0f;
	}
	
	CGFloat scale			= 0.0f;
	CGRect pageRect			= CGPDFPageGetBoxRect(page, kCGPDFMediaBox);
	scale					= width / pageRect.size.width;
	pageRect.size			= CGSizeMake(pageRect.size.width * scale, pageRect.size.height * scale);
	
	return scale;
}

- (CGRect) rectForPage:(CGPDFPageRef)page withWidth:(CGFloat)width {
	CGRect pageRect			= CGPDFPageGetBoxRect(page, kCGPDFMediaBox);
	CGFloat scale			= [self scaleForPage:page withWidth:width];
	pageRect.size			= CGSizeMake(pageRect.size.width * scale, pageRect.size.height * scale);
	
	return pageRect;
}

- (NSData*) dataForPageAtIndex:(NSUInteger)pageIndex {
	return [self dataForPage:[self pageAtIndex:pageIndex]];
}

- (NSData*) dataForPage:(CGPDFPageRef)page {
	
	NSMutableData* pdfData		= [[NSMutableData alloc] initWithLength:0];
	CGRect pageRect				= kCHDefaultPortraitPageRect;
	CGFloat pdfScale			= [self scaleForPage:page withWidth:pageRect.size.width];
	
	UIGraphicsBeginPDFContextToData(pdfData, pageRect, nil);
	
	CGContextRef context		= UIGraphicsGetCurrentContext();
	
	UIGraphicsBeginPDFPage();
	
	CGContextSaveGState(context);
	// Flip the context so that the PDF page is rendered
	// right side up.
	CGContextTranslateCTM(context, 0.0, pageRect.size.height);
	CGContextScaleCTM(context, 1.0, -1.0);
	
	// Scale the context so that the PDF page is rendered 
	// at the correct size for the zoom level.
	CGContextScaleCTM(context, pdfScale, pdfScale);	
	CGContextDrawPDFPage(context, page);
	CGContextRestoreGState(context);
		
	UIGraphicsEndPDFContext();
	
	return [pdfData autorelease];
}

#pragma mark -
#pragma mark Private Methods

- (void) loadPDF {
	_pdfDocumentRef				= CGPDFDocumentCreateWithURL((CFURLRef)_pdfURL);
	_pageCount					= CGPDFDocumentGetNumberOfPages(_pdfDocumentRef);
}

@end
