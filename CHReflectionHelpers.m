//
//  CHReflectionHelpers.m
//  ChaiOneUtils
//
//  Created by Ben Scheirman on 7/13/11.
//  Copyright 2011 ChaiONE. All rights reserved.
//

#import "CHReflectionHelpers.h"
#import "NSString+CHAdditions.h"

NSString* propertyAttributeString(objc_property_t property) {
    return [NSString stringWithCString:property_getAttributes(property) 
                              encoding:NSUTF8StringEncoding];
}

BOOL ch_property_isObject(objc_property_t property) {
    //The attribute string starts with 'T@' if it's a pointer to an id (object)
    return [propertyAttributeString(property) startsWithString:@"T@"];
}

Class ch_property_getClass(objc_property_t property) {
    NSString *attributeString = propertyAttributeString(property);
    
    //The class name is enclosed in quotes
    int firstQuoteIndex = [attributeString indexOfString:@"\""];
    int lastQuoteIndex = [attributeString lastIndexOfString:@"\""];
    NSString *className = [attributeString substringWithRange:NSMakeRange(
                              firstQuoteIndex + 1, 
                              lastQuoteIndex - firstQuoteIndex - 1)];
   
    Class cls =  [[NSBundle mainBundle] classNamed:className];
    return cls == nil ? NSClassFromString(className) : cls;
}

BOOL ch_class_derivesFromClass(Class targetClass, Class superclass) {
    NSString *superclassName = NSStringFromClass(superclass);
    Class cls = targetClass;
    while (true) {
        if ([NSStringFromClass(cls) isEqualToString:superclassName]) {
            return YES;
        }
        
        cls = [cls superclass];
        if (cls == NULL) {
            return NO;
        }
    }
    
    // After we have test case for this one, maybe we can change this to 
    /*
    while (cls != NULL) {
        if ([[NSStringFromClass(cls) isEqualToString:superclassName]) {
            return YES;
        }
        cls = [cls superclass];
    }
    return NO;
     */
    // Logic here is more clear, at the same time, we can reduce the NPath complexity, 
    // Cyclomatic complexity, and NCSS.
}