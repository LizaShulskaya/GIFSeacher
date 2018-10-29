//
//  Downloader.h
//  GiphyApp
//
//  Created by lizaveta shulskaya on 10/29/18.
//  Copyright © 2018 lizaveta shulskaya. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Downloader : NSObject

- (void)fetchGifWithUrl:(NSString*)strUrl andComplition:(void(^)(NSData*data, NSURL *locationUrl))complition;
- (void)fetchGifWithUrlAndError:(NSString*)strUrl andComplition:(void(^)(NSData*data, NSURL *locationUrl, NSError *error ))complition;
@end
