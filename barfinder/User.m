//
//  User.m
//  barfinder
//
//  Created by Jonathan Clark on 2014-04-03.
//  Copyright (c) 2014 Millennial Group. All rights reserved.
//

#import "User.h"

@implementation User
@synthesize uid;
@synthesize name;
@synthesize email;
@synthesize birthday;
@synthesize gender;
@synthesize education;
@synthesize location;

static User *instance =nil;
+(User *)getInstance
{
    @synchronized(self)
    {
        if(instance==nil)
        {
            
            instance= [User new];
        }
    }
    return instance;
}
@end
