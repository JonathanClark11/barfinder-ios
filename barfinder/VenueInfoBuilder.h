//
//  VenueInfoBuilder.h
//  barfinder
//
//  Created by Jonathan Clark on 2014-03-21.
//  Copyright (c) 2014 Millennial Group. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VenueInfoBuilder : NSObject
+ (NSArray *)venueInfoFromJSON:(NSData *)objectNotation error:(NSError **)error;
@end
