//
//  User.h
//  barfinder
//
//  Created by Jonathan Clark on 2014-04-03.
//  Copyright (c) 2014 Millennial Group. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
    This provides global access to the logged in users data
    Example usage:
     User *userObj=[User getInstance]; //get user object
     userObj.name= @"NAME"; //set name here
 */
@interface User : NSObject {
    NSString *uid;
    NSString *name;
    NSString *email;
    NSString *birthday;
    NSString *gender;
    NSString *education;
    NSString *location;
}
@property(nonatomic,retain)NSString *uid;
@property(nonatomic,retain)NSString *name;
@property(nonatomic,retain)NSString *email;
@property(nonatomic,retain)NSString *birthday;
@property(nonatomic,retain)NSString *gender;
@property(nonatomic,retain)NSString *education;
@property(nonatomic,retain)NSString *location;
+(User*)getInstance;
@end
