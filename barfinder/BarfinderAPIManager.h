//
//  BarfinderAPIManager.h
//  barfinder
//
//  Created by Jonathan Clark on 2/21/2014.
//  Copyright (c) 2014 Millennial Group. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "BarfinderAPIManagerDelegate.h"
#import "BarfinderAPICommDelegate.h"

@class BarfinderAPICommunicator;
@interface BarfinderAPIManager : NSObject
@property (strong, nonatomic) BarfinderAPICommunicator *communicator;
@property (weak, nonatomic) id<BarfinderAPIManagerDelegate> delegate;

- (void)fetchVenues;
- (void)fetchVenueInfo:(NSString*)vid;
@end
