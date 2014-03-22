//
//  VenueBuilder.m
//  barfinder
//
//  Created by Jonathan Clark on 2/21/2014.
//  Copyright (c) 2014 Millennial Group. All rights reserved.
//

#import "VenueBuilder.h"
#import "Venue.h"

@implementation VenueBuilder
+ (NSArray *)venuesFromJSON:(NSData *)objectNotation error:(NSError **)error
{
    NSError *localError = nil;
    NSDictionary *parsedObject = [NSJSONSerialization JSONObjectWithData:objectNotation options:0 error:&localError];
    
    if (localError != nil) {
        *error = localError;
        return nil;
    }
    
    NSMutableArray *venues = [[NSMutableArray alloc] init];
    
    NSArray *results = [parsedObject valueForKey:@"bars"];
    NSLog(@"Count %d", results.count);
    @try{
        for (NSDictionary *venueDic in results) {
            Venue *venue = [[Venue alloc] init];
            
            for (NSString *key in venueDic) {
                if ([key isEqualToString:@"id"]) {
                    venue.venueid = [venueDic valueForKey:key];
                } else if ([venue respondsToSelector:NSSelectorFromString(key)]) {
                    [venue setValue:[venueDic valueForKey:key] forKey:key];
                }
            }
            
            [venues addObject:venue];
        }
    }@catch (NSException *e) {
        NSLog(@"JSON ERROR");
    }
    return venues;
}
@end
