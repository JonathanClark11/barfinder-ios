//
//  BarfinderAPICommDelegate.h
//  barfinder
//
//  Created by Jonathan Clark on 2/21/2014.
//  Copyright (c) 2014 Millennial Group. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol BarfinderAPICommDelegate
- (void)receivedVenuesJSON:(NSData *)objectNotation;
- (void)fetchingVenuesFailedWithError:(NSError *)error;
@end
