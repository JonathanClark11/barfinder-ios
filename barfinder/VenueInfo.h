//
//  VenueInfo.h
//  barfinder
//
//  Created by Jonathan Clark on 2014-03-21.
//  Copyright (c) 2014 Millennial Group. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VenueInfo : NSObject
@property (nonatomic, assign) NSString *venueid;
//@property (nonatomic, assign) NSInteger *numberOfEstimates;
//@property (nonatomic, assign) NSInteger *waitTime;
//@property (nonatomic, assign) NSInteger *peopleEstimate;
@property (nonatomic, assign) NSString *name;
@property (nonatomic, assign) NSString *type;
@property (nonatomic, assign) NSString *image;
@property (nonatomic, assign) NSString *image_mobile;
@property (nonatomic, assign) NSString *logo;
@property (nonatomic, assign) NSString *phone;
@property (nonatomic, assign) NSString *address;
//@property (nonatomic, assign) NSInteger *lat;
//@property (nonatomic, assign) NSInteger *lng;
@property (nonatomic, assign) NSString *website;
@property (nonatomic, assign) NSString *twitter;
@property (nonatomic, assign) NSString *facebook;
@property (nonatomic, assign) NSString *cover;
@property (nonatomic, assign) NSString *event;
@property (nonatomic, assign) NSString *city;
@end
