//
//  CHReflectionHelpers.m
//  ChaiOneUtils
//
//  Created by Ben Scheirman on 7/13/11.
//  Copyright 2011 ChaiONE. All rights reserved.
//

#import "CHReflectionHelpers.h"
#import "NSString+CHAdditions.h"

BOOL ch_property_isObject(objc_property_t property) {
    const char * attributeCString = property_getAttributes(property);
    NSString *attributeString = [NSString stringWithCString:attributeCString encoding:NSUTF8StringEncoding];
    
    //The attribute string starts with 'T@' if it's a pointer to an id (object)
    BOOL isObject = [attributeString startsWithString:@"T@"];
    return isObject;
}

Class ch_property_getClass(objc_property_t property) {
    const char * attributeCString = property_getAttributes(property);
    NSString *attributeString = [NSString stringWithCString:attributeCString encoding:NSUTF8StringEncoding];
    
    //The class name is enclosed in quotes
    int firstQuoteIndex = [attributeString indexOfString:@"\""];
    int lastQuoteIndex = [attributeString lastIndexOfString:@"\""];
    NSString *className = [attributeString substringWithRange:NSMakeRange(firstQuoteIndex + 1, lastQuoteIndex - firstQuoteIndex - 1)];
   
    Class cls =  [[NSBundle mainBundle] classNamed:className];
    if (cls == nil) {
        //try other bundles
        cls = NSClassFromString(className);
    }
    
    return cls;
}

BOOL ch_class_derivesFromClass(Class targetClass, Class superclass) {
    NSString *superclassName = NSStringFromClass(superclass);
        
    Class cls = targetClass;
    while(true) {
        NSString *className = NSStringFromClass(cls);
        if ([className isEqualToString:superclassName]) {
            return YES;
        }
        
        cls = [cls superclass];
        if (cls == NULL) {
            return NO;
        }
    }
}