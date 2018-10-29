//
//  JSON-Parser.m
//  GiphyApp
//
//  Created by lizaveta shulskaya on 10/29/18.
//  Copyright © 2018 lizaveta shulskaya. All rights reserved.
//

#import "JSON-Parser.h"

static NSString* const kDataTag = @"data";

@interface JSON_Parser()

@end


@implementation JSON_Parser
-(NSArray*)parseJSONFromURL:(NSString*)url{
    

    NSData *allContentOfJSON = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString:url]];
    NSError *error;
    NSMutableDictionary *allGifsInfo = [NSJSONSerialization JSONObjectWithData:allContentOfJSON
                                                                       options:NSJSONReadingMutableContainers
                                                                         error:&error];
    if(error){
        NSLog(@"Error with JSON-parsing - %@",[error localizedDescription]);
    } else {
        NSArray *dataFromJSONDataTag = allGifsInfo[kDataTag];
        return dataFromJSONDataTag;
    }

    return nil;
}
@end
