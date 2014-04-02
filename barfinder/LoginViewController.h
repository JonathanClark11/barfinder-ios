//
//  LoginViewController.h
//  barfinder
//
//  Created by Jonathan Clark on 2014-03-26.
//  Copyright (c) 2014 Millennial Group. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FacebookSDK/FacebookSDK.h"
#import "AppDelegate.h"

@interface LoginViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *loginButton;

- (IBAction)loginButton:(id)sender;
@end
