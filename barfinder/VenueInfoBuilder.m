//
//  VenueInfoBuilder.m
//  barfinder
//
//  Created by Jonathan Clark on 2014-03-21.
//  Copyright (c) 2014 Millennial Group. All rights reserved.
//

#import "VenueInfoBuilder.h"
#import "VenueInfo.h"

@implementation VenueInfoBuilder
+ (VenueInfo *)venueInfoFromJSON:(NSData *)objectNotation error:(NSError **)error
{
    NSError *localError = nil;
    NSDictionary *parsedObject = [NSJSONSerialization JSONObjectWithData:objectNotation options:0 error:&localError];
    
    if (localError != nil) {
        *error = localError;
        return nil;
    }
    
    VenueInfo *venue = [[VenueInfo alloc] init];
    
    for (NSString *key in parsedObject) {
        if ([venue respondsToSelector:NSSelectorFromString(key)]) {
            [venue setValue:[parsedObject valueForKey:key] forKey:key];
        }
    }
    
    return venue;
}

@end
