//
//  CenterViewController.m
//  barfinder
//
//  Created by Jonathan Clark on 2014-03-19.
//  Copyright (c) 2014 Millennial Group. All rights reserved.
//

#import "CenterViewController.h"

@interface CenterViewController ()

@end

@implementation CenterViewController

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

    RootViewController *rootViewController = (RootViewController *)[[[[UIApplication sharedApplication] delegate] window] rootViewController];
    MenuViewController *leftViewController = (MenuViewController *)rootViewController.leftPanel;
    
    // Store a reference to the center view controller in the left view controller's delegate property
    leftViewController.menuDelegate = self;
    
    [super viewDidLoad];
}

- (void) MenuItemSelected: (NSString*) item
{
    /*
        CAUTION: MEMORY LEAK, need to push existing views!!!!
     */
    
    if ([item isEqualToString:@"Home"]) {
        //[self performSegueWithIdentifier: @"mapViewController" sender: nil];
    } else if ([item isEqualToString:@"Profile"]) {
        //[self performSegueWithIdentifier: @"profileSegue" sender: self];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
