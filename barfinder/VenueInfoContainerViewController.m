//
//  VenueInfoContainerViewController.m
//  barfinder
//
//  Created by Jonathan Clark on 2014-04-10.
//  Copyright (c) 2014 Millennial Group. All rights reserved.
//

#import "VenueInfoContainerViewController.h"

#define SegueIdentifierFirst @"embedFriends"

@interface VenueInfoContainerViewController ()
@property (strong, nonatomic) NSString *currentSegueIdentifier;
@end

@implementation VenueInfoContainerViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self performSegueWithIdentifier:SegueIdentifierFirst sender:nil];
}

- (BOOL)childViewContainsSegue:(UIStoryboardSegue*)segue {
    for (UIViewController *vc in self.childViewControllers) {
        if ([vc isEqual:segue.destinationViewController]) {
            return TRUE;
        }
    }
    return FALSE;
}

-(NSInteger)getCurrentChildViewIndex:(UIStoryboardSegue*)segue {
    NSInteger counter = 0;
    for (UIViewController *vc in self.childViewControllers) {
        if ([vc isEqual:segue.sourceViewController]) {
            return counter;
        }
        counter++;
    }
    return -1;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if (!([self.currentSegueIdentifier isEqualToString:segue.identifier])) {
        self.currentSegueIdentifier = segue.identifier;
        if (self.childViewControllers.count > 0 && [self childViewContainsSegue:segue] == TRUE) {
            [self swapFromViewController:[self.childViewControllers objectAtIndex:[self getCurrentChildViewIndex:segue]] toViewController:segue.destinationViewController];
        } else {
            [self addChildViewController:segue.destinationViewController];
            ((UIViewController *)segue.destinationViewController).view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
            [self.view addSubview:((UIViewController *)segue.destinationViewController).view];
            [segue.destinationViewController didMoveToParentViewController:self];
        }
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

@end