//
//  CHDiskCache.m
//  deliapp
//
//  Created by Ben Scheirman on 2/10/12.
//  Copyright (c) 2012 ChaiONE. All rights reserved.
//

#import "CHDiskCache.h"

#define CHDISK_CACHE_FILENAME @"cache.plist"

static CHDiskCache *__sharedDiskCache;

@implementation CHDiskCache

- (void)dealloc {
    [_cacheFilePath release];
    [super dealloc];
}

- (NSString *)cacheDictionaryPath {
    if (!_cacheFilePath) {
        NSString *cacheDir = CachesDirectory();
        if (!cacheDir) {
            CHLOG(@"Caches directory not found, falling back on documents.");
            cacheDir = DocumentsDirectory();
        }
        
        _cacheFilePath = [[cacheDir stringByAppendingPathComponent:CHDISK_CACHE_FILENAME] retain];
        CHLOG(@"Using caches file: %@", _cacheFilePath);
    }
    
    return _cacheFilePath;
}

- (NSMutableDictionary *)cacheDictionary {
    NSString *filepath = [self cacheDictionaryPath];
    if ([[NSFileManager defaultManager] fileExistsAtPath:filepath]) {
        NSMutableDictionary *cache = [NSKeyedUnarchiver unarchiveObjectWithFile:filepath];
        if (cache) {
            return cache;
        } else {
            // must have been an error, just remove the cache file
            CHLOG(@"Couldn't load the cache file, might be corrupted.  Flushing...");
            [self flushCache];
        }
    } 
    
    return [NSMutableDictionary dictionary];
}

- (void)saveCacheDictionary:(NSDictionary *)cacheDictionary {
    [NSKeyedArchiver archiveRootObject:cacheDictionary toFile:[self cacheDictionaryPath]];
}


+ (id)sharedCache {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        __sharedDiskCache = [[CHDiskCache alloc] init];
    });
    
    return __sharedDiskCache;
}

- (void)storeContent:(id)content forKey:(NSString *)key {
    NSMutableDictionary *cache = [self cacheDictionary];
    [cache setObject:content forKey:key];
    [self saveCacheDictionary:cache];
}

- (void)removeContentForKey:(NSString *)key {
    NSMutableDictionary *cache = [self cacheDictionary];
    [cache removeObjectForKey:key];
    [self saveCacheDictionary:cache];
}

- (id)cachedContentForKey:(NSString *)key {
    NSMutableDictionary *cache = [self cacheDictionary];
    return [cache objectForKey:key];
}

- (BOOL)hasContentForKey:(NSString *)key {
    return [self cachedContentForKey:key] != nil;
}

- (void)flushCache {
    CHLOG(@"Flushing the cache file...");
    NSError *error;
    BOOL worked = [[NSFileManager defaultManager] removeItemAtPath:[self cacheDictionaryPath] error:&error];
    if (!worked) {
        CHLOG(@"Error flushing the cache!  %@", [error localizedDescription]);
    }
}

@end
