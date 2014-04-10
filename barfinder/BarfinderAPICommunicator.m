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

- (void)getVenueInfo:(NSString*)vid
{
    NSString *urlAsString = [NSString stringWithFormat:@"http://api.youqueue.ca/bars/%@", vid];
    NSURL *url = [[NSURL alloc] initWithString:urlAsString];
    NSLog(@"%@", urlAsString);
    
    [NSURLConnection sendAsynchronousRequest:[[NSURLRequest alloc] initWithURL:url] queue:[[NSOperationQueue alloc] init] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
        
        if (error) {
            [self.delegate fetchingVenueInfoFailedWithError:error];
        } else {
            [self.delegate receivedVenueInfoJSON:data];
        }
    }];
}

- (void)getCheckins:(NSString *)vid
{
    NSString *urlAsString = [NSString stringWithFormat:@"http://api.youqueue.ca/bars/%@/checkins", vid];
    NSURL *url = [[NSURL alloc] initWithString:urlAsString];
    NSLog(@"%@", urlAsString);
    
    [NSURLConnection sendAsynchronousRequest:[[NSURLRequest alloc] initWithURL:url] queue:[[NSOperationQueue alloc] init] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
        
        if (error) {
            [self.delegate fetchingCheckinsFailedWithError:error];
        } else {
            [self.delegate receivedCheckinsJSON:data];
        }
    }];
}


- (void) postCheckins:(NSString *)vid :(NSString *)uid
{
    NSData *postData = [[NSString stringWithFormat:@"uid=%@", uid] dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    
    NSString *postLength = [NSString stringWithFormat:@"%d", [postData length]];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://api.youqueue.ca/bars/%@/checkins", vid]]];
    [request setHTTPMethod:@"POST"];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:postData];
    
    NSURLResponse *response;
    NSError *error;
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    NSString *responseString = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
    if (error) {
        [self.delegate fetchingCheckinsFailedWithError:error];
    } else {
        [self.delegate receivedPostJSON:responseData];
    }

}
@end
