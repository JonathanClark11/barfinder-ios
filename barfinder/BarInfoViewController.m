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
    
    [_manager fetchVenueInfo:venueid];
}

- (void)didReceiveVenueInfo:(VenueInfo *)venue
{
    venueName.text = [venue valueForKey:@"name"];
    venueAddress.text = [venue valueForKey:@"address"];
    
    
    
    //    UIImage *image = [[UIImage alloc] initWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[venue valueForKey:@"logo"]]]];
//    [self.venueLogo setImage:image];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
