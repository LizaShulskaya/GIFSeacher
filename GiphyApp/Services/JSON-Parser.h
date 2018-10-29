//
//  JSON-Parser.h
//  GiphyApp
//
//  Created by lizaveta shulskaya on 10/29/18.
//  Copyright © 2018 lizaveta shulskaya. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface JSON_Parser : NSObject


-(NSArray*)parseJSONFromURL:(NSString*)url;

@end
