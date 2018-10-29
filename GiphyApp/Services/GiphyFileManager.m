//
//  GiphyFileManager.m
//  GiphyApp
//
//  Created by lizaveta shulskaya on 10/29/18.
//  Copyright © 2018 lizaveta shulskaya. All rights reserved.
//

#import "GiphyFileManager.h"

@implementation GiphyFileManager


+ (NSURL*)copyToCache:(NSURL*)location {
    NSFileManager *defaultManager = [NSFileManager defaultManager];
    NSArray *urls = [defaultManager URLsForDirectory:NSCachesDirectory inDomains:NSUserDomainMask];
    NSURL *cacheDirectory = [urls objectAtIndex:0];
    NSURL *originalUrl = [NSURL URLWithString:[location lastPathComponent]];
    if (originalUrl == nil) {
        return [NSURL URLWithString:@""];
    }
    NSURL *destinationUrl = [cacheDirectory URLByAppendingPathComponent:[originalUrl lastPathComponent]];
    [defaultManager copyItemAtURL:location toURL:destinationUrl error:nil];
    return destinationUrl;
}

@end
