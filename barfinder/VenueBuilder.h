//
//  VenueBuilder.h
//  barfinder
//
//  Created by Jonathan Clark on 2/21/2014.
//  Copyright (c) 2014 Millennial Group. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VenueBuilder : NSObject
+ (NSArray *)venuesFromJSON:(NSData *)objectNotation error:(NSError **)error;
@end
