//
//  PostResponseBuilder.m
//  barfinder
//
//  Created by Jonathan Clark on 2014-04-10.
//  Copyright (c) 2014 Millennial Group. All rights reserved.
//

#import "PostResponseBuilder.h"

@implementation PostResponseBuilder
+ (PostResponse *)postResponseFromJSON:(NSData *)objectNotation error:(NSError **)error {
    NSError *localError = nil;
    NSDictionary *parsedObject = [NSJSONSerialization JSONObjectWithData:objectNotation options:0 error:&localError];
    
    if (localError != nil) {
        *error = localError;
        return nil;
    }
    
    PostResponse *response = [[PostResponse alloc] init];
    
    for (NSString *key in parsedObject) {
        if ([response respondsToSelector:NSSelectorFromString(key)]) {
            [response setValue:[parsedObject valueForKey:key] forKey:key];
        }
    }
    
    return response;

}
@end
