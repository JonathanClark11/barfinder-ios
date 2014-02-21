//
//  BarfinderAPICommunicator.h
//  barfinder
//
//  Created by Jonathan Clark on 2/21/2014.
//  Copyright (c) 2014 Millennial Group. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol BarfinderAPICommDelegate;

@interface BarfinderAPICommunicator : NSObject
@property (weak, nonatomic) id<BarfinderAPICommDelegate> delegate;
- (void)getVenues;
//- (void)searchGroupsAtCoordinate:(CLLocationCoordinate2D)coordinate;
@end
