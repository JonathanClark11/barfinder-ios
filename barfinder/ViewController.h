//
//  ViewController.h
//  barfinder
//
//  Created by Stephen Richter on 2/19/2014.
//  Copyright (c) 2014 Millennial Group. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FacebookSDK/FacebookSDK.h"

@interface ViewController : UIViewController

@property(nonatomic,retain) IBOutlet FBLoginView *loginView;

@property(nonatomic,retain) IBOutlet UILabel *nameLabel;

@property(nonatomic,retain) IBOutlet FBProfilePictureView *profilePictureView;

// Friends Picker
@property (strong, nonatomic) IBOutlet UITextView *selectedFriendsView;
@property (retain, nonatomic) FBFriendPickerViewController *friendPickerController;
- (IBAction)pickFriendsButtonClick:(id)sender;

@end
