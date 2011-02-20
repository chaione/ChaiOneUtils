/*
 *  NSObject-Dispatch.h
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

#import "NSObject-Dispatch.h"
#import "CHLogging.h"


@implementation NSObject (ChaiOneUtils)

- (void) dispatchSelector:(SEL)selector 
				   target:(id)target 
				  objects:(NSArray*)objects 
			 onMainThread:(BOOL)onMainThread {
	
	if(target && [target respondsToSelector:selector]) {
		
		NSMethodSignature* signature	= [target methodSignatureForSelector:selector];
		if(signature) {
			NSInvocation* invocation	= [NSInvocation invocationWithMethodSignature:signature];		
			
			@try {
				[invocation setTarget:target];			
				[invocation setSelector:selector];
				
				if(objects) {				
					NSInteger objectsCount	= [objects count];
					
					for(NSInteger i=0; i < objectsCount; i++) {
						NSObject* obj = [objects objectAtIndex:i];
						[invocation setArgument:&obj atIndex:i+2];
					}				
				}
				
				[invocation retainArguments];
				
				if(onMainThread) {
					[invocation performSelectorOnMainThread:@selector(invoke) 
												 withObject:nil 
											  waitUntilDone:NO];	
				}
				else {
					[invocation performSelector:@selector(invoke) 
									   onThread:[NSThread currentThread] 
									 withObject:nil 
								  waitUntilDone:NO];
				}
			}
			@catch (NSException * e) {
				CHEXCEPTION(e)
			}
			@finally {
				[signature release];
				[invocation release];
			}			
		}		
	}
}

@end
