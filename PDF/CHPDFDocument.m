/*
 *  CHPDFDocument.m
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

#import "CHPDFDocument.h"
#import "CHPDFPage.h"
#import "CHLogging.h"

#import <UIKit/UIImage.h>


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
	return [[self pageAtIndex:pageIndex] imageForRect:pageRect];
}

- (CHPDFPage*) pageAtIndex:(NSUInteger)pageIndex {
	CGPDFPageRef page = CGPDFDocumentGetPage([self CGPDFDocument], pageIndex);
	
	return [CHPDFPage pageWithCGPDFPage:page];
}


- (NSData*) dataForPageAtIndex:(NSUInteger)pageIndex {
	return [[self pageAtIndex:pageIndex] data];
}

#pragma mark -
#pragma mark Private Methods

- (void) loadPDF {
	_pdfDocumentRef				= CGPDFDocumentCreateWithURL((CFURLRef)_pdfURL);
	_pageCount					= CGPDFDocumentGetNumberOfPages(_pdfDocumentRef);
}

@end
