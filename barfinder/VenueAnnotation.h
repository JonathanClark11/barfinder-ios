//
//  VenueAnnotation.h
//  barfinder
//
//  Created by Jonathan Clark on 2014-03-21.
//  Copyright (c) 2014 Millennial Group. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface VenueAnnotation : NSObject <MKAnnotation>
@property (nonatomic) CLLocationCoordinate2D coordinate;
@property (nonatomic, copy) NSString *title, *subtitle;
@property (nonatomic) NSString *venueid;
- (id)initWithLocation:(CLLocationCoordinate2D)coord;
@end
