//
//  BarInfoViewController.h
//  barfinder
//
//  Created by Jonathan Clark on 2014-03-11.
//  Copyright (c) 2014 Millennial Group. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VenueInfoContainerViewController.h"

@interface BarInfoViewController : UIViewController

@property (nonatomic, retain) NSString *venueid;
@property (weak, nonatomic) IBOutlet UILabel *venueName;
@property (nonatomic, retain) IBOutlet UILabel *venueAddress;
@property (weak, nonatomic) IBOutlet UILabel *venueDescription;
@property (weak, nonatomic) IBOutlet UILabel *venueEvents;
@property (weak, nonatomic) IBOutlet UILabel *venueCover;
@property (weak, nonatomic) IBOutlet UILabel *venueTwitter;
@property (weak, nonatomic) IBOutlet UIImageView *venueLogo;
@property (weak, nonatomic) IBOutlet UIImageView *venueBackground;

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *loadingSpinner;
@property (weak, nonatomic) IBOutlet UIButton *checkinButton;

@property (weak, nonatomic) IBOutlet UIView *loadingView;
@property (weak, nonatomic) IBOutlet UIView *infoContainer;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentTabs;

@property (nonatomic, weak) VenueInfoContainerViewController *containerViewController;


-(IBAction)changeSegment:(id)sender;

- (IBAction)checkinAction:(id)sender;

@end
