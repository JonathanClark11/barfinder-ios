//
//  BarInfoViewController.m
//  barfinder
//
//  Created by Jonathan Clark on 2014-03-11.
//  Copyright (c) 2014 Millennial Group. All rights reserved.
//

#import "BarInfoViewController.h"
#import "BarfinderAPIManager.h"
#import "BarfinderAPICommunicator.h"
#import "VenueInfo.h"

@interface BarInfoViewController () <BarfinderAPIManagerDelegate> {
    BarfinderAPIManager *_manager;
}
@end

@implementation BarInfoViewController
@synthesize venueid;
@synthesize venueAddress;
@synthesize venueCover;
@synthesize venueDescription;
@synthesize venueEvents;
@synthesize venueLogo;
@synthesize venueName;

@synthesize loadingSpinner;
@synthesize loadingView;

@synthesize infoContainer;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //Load bar info
    _manager = [[BarfinderAPIManager alloc] init];
    _manager.communicator = [[BarfinderAPICommunicator alloc] init];
    _manager.communicator.delegate = _manager;
    _manager.delegate = self;
    
    [loadingSpinner startAnimating];
    NSLog(@"Loading venue info");
    [_manager fetchVenueInfo:venueid];
}

- (void)didReceiveVenueInfo:(VenueInfo *)venue
{
    NSLog(@"Loaded Venue Info");
    //load image
    UIImage *logoimage = [[UIImage alloc] initWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[venue valueForKey:@"logo"]]]];
    
//    NSURL *url = [NSURL URLWithString:@"http://www.youqueue.ca/public/images/bars/4130/logo.png"];
//    NSData *data = [NSData dataWithContentsOfURL:url];
//    UIImage *logoimage = [UIImage imageWithData:data];
    
    
    
    [venueName performSelectorOnMainThread:@selector(setText:) withObject:[venue valueForKey:@"name"] waitUntilDone:NO];
    [venueAddress performSelectorOnMainThread:@selector(setText:) withObject:[venue valueForKey:@"address"] waitUntilDone:NO];
    [venueDescription performSelectorOnMainThread:@selector(setText:) withObject:[venue valueForKey:@"type"] waitUntilDone:NO];
    [venueLogo performSelectorOnMainThread:@selector(setImage:) withObject:logoimage waitUntilDone:NO];
    
    [venueLogo performSelectorOnMainThread:@selector(setNeedsDisplay) withObject:nil waitUntilDone:YES];
    
    //Transfer views
    dispatch_async(dispatch_get_main_queue(), ^{
        //hide loading view
        [loadingSpinner stopAnimating];
        [loadingView setHidden:YES];
        
        //Show info view
        [infoContainer setHidden:NO];
    });
}

- (void)updateVenueInfoUI:(VenueInfo*) venue {
    [venueDescription setText:[venue valueForKey:@"type"]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
