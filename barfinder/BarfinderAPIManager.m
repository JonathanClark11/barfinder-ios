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

#import "CheckinInfo.h"
#import "CheckinINfoBuilder.h"

#import "PostResponseBuilder.h"

@implementation BarfinderAPIManager

- (void)fetchVenues
{
    [self.communicator getVenues];
}
- (void)fetchVenueInfo:(NSString*)vid
{
    [self.communicator getVenueInfo:vid];
}

- (void)postCheckin:(NSString*)venueid :(NSString*)userid {
    [self.communicator postCheckins:venueid :userid];
}
- (void)getCheckins:(NSString*)venueid {
    [self.communicator getCheckins:venueid];
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

- (void)receivedCheckinsJSON:(NSData *)objectNotation {
    NSError *error = nil;
    CheckinInfo *info = [CheckinInfoBuilder checkinInfoFromJSON:objectNotation error:&error];
    if (error != nil) {
        [self.delegate fetchingCheckinsFailedWithError:error];
    } else {
        [self.delegate didReceiveCheckins:info];
    }
}

- (void)fetchingCheckinsFailedWithError:(NSError *)error {
    [self.delegate fetchingCheckinsFailedWithError:error];
}


- (void)receivedPostJSON:(NSData*)objectNotation {
    NSError *error = nil;
    PostResponse *response = [PostResponseBuilder postResponseFromJSON:objectNotation error:&error];
    if (error != nil) {
        [self.delegate fetchingPostResponseFailedWithError:error];
    } else {
        [self.delegate didReceivePostResponse:response];
    }
}

@end
