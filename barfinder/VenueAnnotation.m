//
//  VenueAnnotation.m
//  barfinder
//
//  Created by Jonathan Clark on 2014-03-21.
//  Copyright (c) 2014 Millennial Group. All rights reserved.
//

#import "VenueAnnotation.h"

@implementation VenueAnnotation
- (id)initWithLocation: (CLLocationCoordinate2D) coord {
    self = [super init];
    if (self) {
        self->_coordinate = coord;
    }
    return self;
}
@end
