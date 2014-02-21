//
//  BarfinderAPIManager.m
//  barfinder
//
//  Created by Jonathan Clark on 2/21/2014.
//  Copyright (c) 2014 Millennial Group. All rights reserved.
//

#import "BarfinderAPIManager.h"
#import "VenueBuilder.h"
#import "BarfinderAPICommunicator.h"

@implementation BarfinderAPIManager

- (void)fetchVenues
{
    [self.communicator getVenues];
}

#pragma mark - BarfinderAPICommunicatorDelegate

- (void)receivedVenuesJSON:(NSData *)objectNotation
{
    NSError *error = nil;
    NSArray *venues = [VenueBuilder venuesFromJSON:objectNotation error:&error];
    
    if (error != nil) {
        [self.delegate fetchingVenuesFailedWithError:error];
    } else {
        [self.delegate didReceiveVenues:venues];
    }
}

- (void)fetchingGroupsFailedWithError:(NSError *)error
{
    [self.delegate fetchingVenuesFailedWithError:error];
}

@end
