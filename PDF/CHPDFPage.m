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

#ifdef DEBUG 
#	import <UIKit/UIGeometry.h>
#endif

// An 8.5" x 11" page
const CGRect kCHDefaultPortraitPageRect	= {
	// Origin (x,y)
	{ 0.0f, 0.0f },
	// Size (w,h)
	{ 612.0f, 792.0f }
};

// An 11" x 8.5" page
const CGRect kCHDefaultLandscapePageRect = {
	// Origin (x,y)
	{ 0.0f, 0.0f },
	// Size (w,h)
	{ 792.0f, 612.0f }
};


@interface CHPDFPage(Private)
- (void) renderWithContext:(CGContextRef)context inRect:(CGRect)rect;
@end


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

- (NSInteger) pageNumber {
	return CGPDFPageGetPageNumber([self CGPDFPage]);
}


- (BOOL) isPortrait {
	CGRect pageRect	= CGPDFPageGetBoxRect([self CGPDFPage], kCGPDFMediaBox);
	CHDEBUG(@"pageRect = %@", NSStringFromCGRect(pageRect));
	
	return (pageRect.size.width < pageRect.size.height);
}


- (BOOL) isLandscape {
	CGRect pageRect	= CGPDFPageGetBoxRect([self CGPDFPage], kCGPDFMediaBox);
	CHDEBUG(@"pageRect = %@", NSStringFromCGRect(pageRect));
	
	return (pageRect.size.width > pageRect.size.height);
}


- (UIImage*) imageForRect:(CGRect)pageRect {
	
	UIGraphicsBeginImageContext(pageRect.size);
	
	UIImage* thumbnail			= nil;
	CGContextRef context		= UIGraphicsGetCurrentContext();
	
	[self renderWithContext:context inRect:pageRect];
		
	thumbnail					= UIGraphicsGetImageFromCurrentImageContext();
	
	UIGraphicsEndImageContext();
	
	return thumbnail;
}


- (NSData*) data {
	NSMutableData* pdfData		= [[NSMutableData alloc] initWithLength:0];
	CGRect pageRect				= CGPDFPageGetBoxRect([self CGPDFPage], kCGPDFMediaBox);
	
	UIGraphicsBeginPDFContextToData(pdfData, pageRect, nil);
	
	CGContextRef context		= UIGraphicsGetCurrentContext();
	
	UIGraphicsBeginPDFPage();
	
	[self renderWithContext:context inRect:pageRect];
	
	UIGraphicsEndPDFContext();
	
	return [pdfData autorelease];
}

- (void) writeToFileAtPath:(NSString*)filePath {
	CGRect pageRect				= CGPDFPageGetBoxRect([self CGPDFPage], kCGPDFMediaBox);
	
	UIGraphicsBeginPDFContextToFile(filePath, pageRect, nil);
	
	CGContextRef context		= UIGraphicsGetCurrentContext();
	
	UIGraphicsBeginPDFPage();
	
	[self renderWithContext:context inRect:pageRect];
	
	UIGraphicsEndPDFContext();
}


- (CGRect) mediaBoxRect {
	return CGPDFPageGetBoxRect([self CGPDFPage], kCGPDFMediaBox);
}

- (CGRect) cropBoxRect {
	return CGPDFPageGetBoxRect([self CGPDFPage], kCGPDFCropBox);
}

- (CGRect) trimBoxRect {
	return CGPDFPageGetBoxRect([self CGPDFPage], kCGPDFTrimBox);
}

- (CGRect) artBoxRect {
	return CGPDFPageGetBoxRect([self CGPDFPage], kCGPDFArtBox);
}

- (CGRect) bleedBoxRect {
	return CGPDFPageGetBoxRect([self CGPDFPage], kCGPDFBleedBox);
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

#pragma mark -
#pragma mark Private Methods

- (void) renderWithContext:(CGContextRef)context inRect:(CGRect)rect {
	CGFloat pdfScale		= [self scaleForWidth:rect.size.width];
	
	// First fill the background with white.
	CGContextSetRGBFillColor(context, 1.0f, 1.0f, 1.0f, 1.0f);
	CGContextFillRect(context, rect);
	
	CGContextSaveGState(context);
	// Flip the context so that the PDF page is rendered
	// right side up.
	CGContextTranslateCTM(context, 0.0, rect.size.height);
	CGContextScaleCTM(context, 1.0, -1.0);
	
	// Scale the context so that the PDF page is rendered 
	// at the correct size for the zoom level.
	CGContextScaleCTM(context, pdfScale, pdfScale);	
	CGContextDrawPDFPage(context, [self CGPDFPage]);
	CGContextRestoreGState(context);
}

@end
