//
//  BarfinderAPICommunicator.m
//  barfinder
//
//  Created by Jonathan Clark on 2/21/2014.
//  Copyright (c) 2014 Millennial Group. All rights reserved.
//

#import "BarfinderAPICommunicator.h"
#import "BarfinderAPICommDelegate.h"

@implementation BarfinderAPICommunicator
- (void)getVenues
{
    NSString *urlAsString = [NSString stringWithFormat:@"http://api.youqueue.ca/bars"];
    NSURL *url = [[NSURL alloc] initWithString:urlAsString];
    NSLog(@"%@", urlAsString);
    
    [NSURLConnection sendAsynchronousRequest:[[NSURLRequest alloc] initWithURL:url] queue:[[NSOperationQueue alloc] init] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
        
        if (error) {
            [self.delegate fetchingVenuesFailedWithError:error];
        } else {
            [self.delegate receivedVenuesJSON:data];
        }
    }];
}
@end
