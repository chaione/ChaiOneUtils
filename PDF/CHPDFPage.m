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

#import "CHPDFPage.h"
#import "CHLogging.h"
#import <UIKit/UIGraphics.h>

// An 8.5" x 11" page
const CGRect kCHDefaultPortraitPageRect	= {
	// Origin (x,y)
	{ 0.0f, 0.0f },
	// Size (w,h)
	{ 612.0f, 792.0f }
};

#pragma mark -
@implementation CHPDFPage


#pragma mark -
#pragma mark Memory Management

- (void) dealloc {
	RELEASE_PAGE(_pageRef);
	[super dealloc];
}

+ (CHPDFPage*) pageWithCGPDFPage:(CGPDFPageRef)page {
	CHPDFPage* pdfPage	= [[CHPDFPage alloc] initWithCGPDFPage:page];
	return [pdfPage autorelease];
}

- (id) initWithCGPDFPage:(CGPDFPageRef)page {
	if (self = [super init]) {
		RETAIN_PAGE(page);
		_pageRef = page;
	}
	
	return self;
}

#pragma mark -
#pragma mark Public Methods

- (CGPDFPageRef) CGPDFPage {
	return _pageRef;
}

- (UIImage*) imageForRect:(CGRect)pageRect {
	
	UIGraphicsBeginImageContext(pageRect.size);
	
	UIImage* thumbnail			= nil;
	CGFloat pdfScale			= [self scaleForWidth:pageRect.size.width];
	
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
		CGContextDrawPDFPage(context, [self CGPDFPage]);
		CGContextRestoreGState(context);
		
		thumbnail				= UIGraphicsGetImageFromCurrentImageContext();
		
		UIGraphicsEndImageContext();
	}
	@catch (NSException * e) {
		CHEXCEPTION(e)
	}
	@finally {
		;
	}
	
	return thumbnail;
}


- (NSData*) data {
	NSMutableData* pdfData		= [[NSMutableData alloc] initWithLength:0];
	CGRect pageRect				= kCHDefaultPortraitPageRect;
	CGFloat pdfScale			= [self scaleForWidth:pageRect.size.width];
	
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
	CGContextDrawPDFPage(context, [self CGPDFPage]);
	CGContextRestoreGState(context);
	
	UIGraphicsEndPDFContext();
	
	return [pdfData autorelease];
}

- (CGRect) rectForWidth:(CGFloat)width {
	CGRect pageRect			= CGPDFPageGetBoxRect([self CGPDFPage], kCGPDFMediaBox);
	CGFloat scale			= [self scaleForWidth:width];
	pageRect.size			= CGSizeMake(pageRect.size.width * scale, pageRect.size.height * scale);
	
	return pageRect;
}


- (CGFloat) scaleForWidth:(CGFloat)width {
	if (NULL == [self CGPDFPage]) {
		return 0.0f;
	}
	
	CGFloat scale			= 0.0f;
	CGRect pageRect			= CGPDFPageGetBoxRect([self CGPDFPage], kCGPDFMediaBox);
	scale					= width / pageRect.size.width;
	pageRect.size			= CGSizeMake(pageRect.size.width * scale, pageRect.size.height * scale);
	
	return scale;
}

@end
