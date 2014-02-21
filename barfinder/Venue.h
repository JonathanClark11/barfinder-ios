//
//  Venue.h
//  barfinder
//
//  Created by Jonathan Clark on 2/21/2014.
//  Copyright (c) 2014 Millennial Group. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Venue : NSObject
@property (nonatomic, assign) NSInteger *vid;
@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSNumber *lat;
@property (nonatomic, retain) NSNumber *lng;
@property (strong, nonatomic) NSString *address;
@end
