//
//  VenueInfoContainerViewController.m
//  barfinder
//
//  Created by Jonathan Clark on 2014-04-10.
//  Copyright (c) 2014 Millennial Group. All rights reserved.
//

#import "VenueInfoContainerViewController.h"

#define SegueIdentifierFirst @"embedFriends"
#define SegueIdentifierSecond @"embedPeople"
#define SegueIdentifierThird @"embedPhotos"
#define SegueIdentifierFourth @"embedChat"

@interface VenueInfoContainerViewController ()
@property (strong, nonatomic) NSString *currentSegueIdentifier;
@end

@implementation VenueInfoContainerViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.currentSegueIdentifier = SegueIdentifierFirst;
    [self performSegueWithIdentifier:self.currentSegueIdentifier sender:nil];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:SegueIdentifierFirst])
    {
        if (self.childViewControllers.count > 0) {
            [self swapFromViewController:[self.childViewControllers objectAtIndex:0] toViewController:segue.destinationViewController];
        }
        else {
            [self addChildViewController:segue.destinationViewController];
            ((UIViewController *)segue.destinationViewController).view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
            [self.view addSubview:((UIViewController *)segue.destinationViewController).view];
            [segue.destinationViewController didMoveToParentViewController:self];
        }
    }
    else if ([segue.identifier isEqualToString:SegueIdentifierSecond])
    {
        [self swapFromViewController:[self.childViewControllers objectAtIndex:0] toViewController:segue.destinationViewController];
    }
    else if ([segue.identifier isEqualToString:SegueIdentifierThird])
    {
        [self swapFromViewController:[self.childViewControllers objectAtIndex:0] toViewController:segue.destinationViewController];
    }
    else if ([segue.identifier isEqualToString:SegueIdentifierFourth])
    {
        [self swapFromViewController:[self.childViewControllers objectAtIndex:0] toViewController:segue.destinationViewController];
    }
}

- (void)swapFromViewController:(UIViewController *)fromViewController toViewController:(UIViewController *)toViewController
{
    toViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    
    [fromViewController willMoveToParentViewController:nil];
    [self addChildViewController:toViewController];
    [self transitionFromViewController:fromViewController toViewController:toViewController duration:1.0 options:UIViewAnimationOptionTransitionCrossDissolve animations:nil completion:^(BOOL finished) {
        [fromViewController removeFromParentViewController];
        [toViewController didMoveToParentViewController:self];
    }];
}

- (void)setViewController:(NSString*)segueIdentifier;
{
    if (!([self.currentSegueIdentifier isEqualToString:segueIdentifier])) {
        self.currentSegueIdentifier = segueIdentifier;
        [self performSegueWithIdentifier:self.currentSegueIdentifier sender:nil];
    }
}

@end