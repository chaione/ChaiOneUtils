//
//  CHDiskCache.h
//  deliapp
//
//  Created by Ben Scheirman on 2/10/12.
//  Copyright (c) 2012 ChaiONE. All rights reserved.
//

#import <Foundation/Foundation.h>

/* Allows saving data directly to disk for a given key.  Usage is similar to NSMutableDictionary, however
 the contents must be archivable (NSCoding compliant). */

@interface CHDiskCache : NSObject {
    NSString *_cacheFilePath;
}

/* A shared instance to access the cache globally */
+ (id)sharedCache;

/* Store the content under the given key.  Any existing content will be removed.  The content must be NSCoding compliant. */
- (void)storeContent:(id)content forKey:(NSString *)key;

/* Remove the object for the provided key. */
- (void)removeContentForKey:(NSString *)key;

/* Returns the cached content for a given key.  Will return nil if there is not a value for that key. */
- (id)cachedContentForKey:(NSString *)key;

/* Returns YES if there is cached content for a given key.  NO otherwise. */
- (BOOL)hasContentForKey:(NSString *)key;

/* Deletes the entire caches file. */
- (void)flushCache;

@end
