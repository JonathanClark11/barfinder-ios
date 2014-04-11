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
#import "User.h"

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
@synthesize venueBackground;
@synthesize venueTwitter;

@synthesize loadingSpinner;
@synthesize loadingView;

@synthesize checkinButton;

@synthesize infoContainer;

@synthesize segmentTabs;

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
    
    UIImage *bgimage = [[UIImage alloc] initWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[venue valueForKey:@"image_mobile"]]]];
    //load image
    UIImage *logoimage = [[UIImage alloc] initWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[venue valueForKey:@"logo"]]]];
    
    
    
    
    [venueName performSelectorOnMainThread:@selector(setText:) withObject:[venue valueForKey:@"name"] waitUntilDone:NO];
    [venueAddress performSelectorOnMainThread:@selector(setText:) withObject:[venue valueForKey:@"address"] waitUntilDone:NO];
    [venueTwitter performSelectorOnMainThread:@selector(setText:) withObject:[venue valueForKey:@"twitter"] waitUntilDone:NO];
    
    [venueLogo performSelectorOnMainThread:@selector(setImage:) withObject:logoimage waitUntilDone:NO];
    
    [venueLogo performSelectorOnMainThread:@selector(setNeedsDisplay) withObject:nil waitUntilDone:NO];
    
    [venueBackground performSelectorOnMainThread:@selector(setImage:) withObject:bgimage waitUntilDone:NO];
    
    [venueBackground performSelectorOnMainThread:@selector(setNeedsDisplay) withObject:nil waitUntilDone:YES];
    
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

- (IBAction)checkinAction:(id)sender {
    User *userObj=[User getInstance]; //get user object
    [_manager postCheckin:venueid :userObj.uid];
}

- (void)didReceivePostResponse:(PostResponse*)response {
    if ([response.response isEqualToString:@"success"]) {
        NSLog(@"checked in");
        //todo: change ui
    } else {
        NSLog(@"Failed to checkin");
    }
}
- (void) fetchingPostResponseFailedWithError:(NSError *)error {
    NSLog(@"Failed to checkin");
}

-(IBAction)changeSegment:(id)sender{
	if(segmentTabs.selectedSegmentIndex == 0){
		NSLog(@"FRIENDS");
        [self.containerViewController performSegueWithIdentifier:@"embedFriends" sender:nil];
    }
	if(segmentTabs.selectedSegmentIndex == 1){
        NSLog(@"PEOPLE");
        [self.containerViewController performSegueWithIdentifier:@"embedPeople" sender:nil];
	}
    if(segmentTabs.selectedSegmentIndex == 2){
        NSLog(@"PHOTOS");
        [self.containerViewController performSegueWithIdentifier:@"embedPhotos" sender:nil];
	}
    if(segmentTabs.selectedSegmentIndex == 3){
        NSLog(@"CHAT");
        [self.containerViewController performSegueWithIdentifier:@"embedChat" sender:nil];
	}
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"embedContainer"]) {
        self.containerViewController = segue.destinationViewController;
    }
}
@end
