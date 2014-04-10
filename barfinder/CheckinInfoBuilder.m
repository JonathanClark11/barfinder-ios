//
//  CheckinInfoBuilder.m
//  barfinder
//
//  Created by Jonathan Clark on 2014-04-10.
//  Copyright (c) 2014 Millennial Group. All rights reserved.
//

#import "CheckinInfoBuilder.h"
#import "CheckinInfo.h"

@implementation CheckinInfoBuilder
+ (CheckinInfo *)checkinInfoFromJSON:(NSData *)objectNotation error:(NSError **)error
{
    NSError *localError = nil;
    NSDictionary *parsedObject = [NSJSONSerialization JSONObjectWithData:objectNotation options:0 error:&localError];
    
    if (localError != nil) {
        *error = localError;
        return nil;
    }
    
    CheckinInfo *info = [[CheckinInfo alloc] init];
    
    for (NSString *key in parsedObject) {
        if ([info respondsToSelector:NSSelectorFromString(key)]) {
            [info setValue:[parsedObject valueForKey:key] forKey:key];
        }
    }
    
    return info;
}

@end
