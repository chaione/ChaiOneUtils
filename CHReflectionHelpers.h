//
//  CHReflectionHelpers.h
//  ChaiOneUtils
//
//  Created by Ben Scheirman on 7/13/11.
//  Copyright 2011 ChaiONE. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/objc.h>
#import <objc/runtime.h>

/* Returns YES if the property's type is an NSObject derivative.  Returns NO for scalar types. */
BOOL ch_property_isObject(objc_property_t property);

/* Returns the Class instance that a property is defined with. */
Class ch_property_getClass(objc_property_t property);