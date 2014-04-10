//
//  BarfinderAPIManagerDelegate.h
//  barfinder
//
//  Created by Jonathan Clark on 2/21/2014.
//  Copyright (c) 2014 Millennial Group. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VenueInfo.h"
#import "CheckinInfo.h"
#import "PostResponse.h"

@protocol BarfinderAPIManagerDelegate
- (void)didReceiveVenues:(NSArray *)venues;
- (void)fetchingVenuesFailedWithError:(NSError *)error;

- (void)didReceiveVenueInfo:(VenueInfo *)venue;
- (void)fetchingVenueInfoFailedWithError:(NSError *)error;

- (void)didReceiveCheckins:(CheckinInfo *)checkins;
- (void)fetchingCheckinsFailedWithError:(NSError *)error;

- (void)didReceivePostResponse:(PostResponse*)response;
- (void)fetchingPostResponseFailedWithError:(NSError *)error;
@end
