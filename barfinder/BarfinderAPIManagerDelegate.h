//
//  BarfinderAPIManagerDelegate.h
//  barfinder
//
//  Created by Jonathan Clark on 2/21/2014.
//  Copyright (c) 2014 Millennial Group. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol BarfinderAPIManagerDelegate
- (void)didReceiveVenues:(NSArray *)venues;
- (void)fetchingVenuesFailedWithError:(NSError *)error;
@end
