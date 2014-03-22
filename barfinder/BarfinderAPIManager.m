//
//  BarfinderAPIManager.m
//  barfinder
//
//  Created by Jonathan Clark on 2/21/2014.
//  Copyright (c) 2014 Millennial Group. All rights reserved.
//

#import "BarfinderAPIManager.h"
#import "VenueBuilder.h"
#import "VenueInfoBuilder.h"
#import "BarfinderAPICommunicator.h"
#import "VenueInfo.h"
@implementation BarfinderAPIManager

- (void)fetchVenues
{
    [self.communicator getVenues];
}
- (void)fetchVenueInfo:(NSString*)vid
{
    [self.communicator getVenueInfo:vid];
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

- (void)fetchingVenuesFailedWithError:(NSError *)error
{
    [self.delegate fetchingVenuesFailedWithError:error];
}

- (void)receivedVenueInfoJSON:(NSData *)objectNotation
{
    NSError *error = nil;
    VenueInfo *venue = [VenueInfoBuilder venueInfoFromJSON:objectNotation error:&error];
    
    if (error != nil) {
        [self.delegate fetchingVenueInfoFailedWithError:error];
    } else {
        [self.delegate didReceiveVenueInfo:venue];
    }
}

- (void)fetchingVenueInfoFailedWithError:(NSError *)error
{
    [self.delegate fetchingVenueInfoFailedWithError:error];
}

@end
