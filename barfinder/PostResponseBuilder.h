//
//  PostResponseBuilder.h
//  barfinder
//
//  Created by Jonathan Clark on 2014-04-10.
//  Copyright (c) 2014 Millennial Group. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PostResponse.h"

@interface PostResponseBuilder : NSObject
+ (PostResponse *)postResponseFromJSON:(NSData *)objectNotation error:(NSError **)error;
@end
