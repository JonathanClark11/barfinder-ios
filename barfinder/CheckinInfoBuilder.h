//
//  CheckinInfoBuilder.h
//  barfinder
//
//  Created by Jonathan Clark on 2014-04-10.
//  Copyright (c) 2014 Millennial Group. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CheckinInfoBuilder : NSObject
+ (NSArray *)checkinInfoFromJSON:(NSData *)objectNotation error:(NSError **)error;

@end
