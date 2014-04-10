//
//  LoginViewController.m
//  barfinder
//
//  Created by Jonathan Clark on 2014-03-26.
//  Copyright (c) 2014 Millennial Group. All rights reserved.
//

#import "LoginViewController.h"
#import "User.h"

@interface LoginViewController ()

@end

@implementation LoginViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter]
     addObserver:self
     selector:@selector(sessionStateChanged:)
     name:FBSessionStateChangedNotification
     object:nil];
    // Check the session for a cached token to show the proper authenticated
    // UI. However, since this is not user intitiated, do not show the login UX.
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    [appDelegate openSessionWithAllowLoginUI:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark facebook login
- (void)sessionStateChanged:(NSNotification*)notification {
    if (FBSession.activeSession.isOpen) {
        //They're already logged in :)
        [FBRequestConnection
         startForMeWithCompletionHandler:^(FBRequestConnection *connection,
                                           id<FBGraphUser> user,
                                           NSError *error) {
             if (!error) {
                 //log output
                 [FBSettings setLoggingBehavior:[NSSet setWithObjects:
                                                 FBLoggingBehaviorFBRequests, nil]];
                 
                 User *userObj=[User getInstance]; //get user object
                 userObj.uid = user.id;
                 userObj.name = user.name; //set name here
                 userObj.birthday = user.birthday;
                 userObj.email = [user objectForKey:@"email"];
                 userObj.education = [user objectForKey:@"education"];
                 userObj.location = [user.location objectForKey:@"name"];
                 userObj.gender = [user objectForKey:@"gender"];
                 
                 
                 
                 NSString *userInfo = @" ";
                 

                 
                 userInfo = [userInfo stringByAppendingString:[NSString stringWithFormat:@"UID: %@\n\n", user.id]];
                 // Example: typed access (name)
                 // - no special permissions required
                 userInfo = [userInfo stringByAppendingString:[NSString stringWithFormat:@"Name: %@\n\n", user.name]];
                 
                 // Example: typed access, (birthday)
                 // - requires user_birthday permission
                 userInfo = [userInfo stringByAppendingString:[NSString stringWithFormat:@"Birthday: %@\n\n", user.birthday]];
                 
                 // Example: typed access, (email)
                 // - requires user_email permission
                 userInfo = [userInfo stringByAppendingString:[NSString stringWithFormat:@"Email: %@\n\n", [user objectForKey:@"email"]]];
                 
                 // Example: typed access, (education)
                 // - requires user_education_history permission
                 userInfo = [userInfo stringByAppendingString:[NSString stringWithFormat:@"Education: %@\n\n", [user objectForKey:@"education"]]];
                 
                 // Example: partially typed access, to location field,
                 // name key (location)
                 // - requires user_location permission
                 userInfo = [userInfo
                             stringByAppendingString:
                             [NSString stringWithFormat:@"Location: %@\n\n",
                              [user.location objectForKey:@"name"]]];
                 
                 // Example: access via key (locale)
                 // - no special permissions required
                 userInfo = [userInfo
                             stringByAppendingString:
                             [NSString stringWithFormat:@"Locale: %@\n\n",
                              [user objectForKey:@"locale"]]];
                 
                 // Example: access via key for array (languages)
                 // - requires user_likes permission
                 if ([user objectForKey:@"languages"]) {
                     NSArray *languages = [user objectForKey:@"languages"];
                     NSMutableArray *languageNames = [[NSMutableArray alloc] init];
                     for (int i = 0; i < [languages count]; i++) {
                         [languageNames addObject:[[languages
                                                    objectAtIndex:i]
                                                   objectForKey:@"name"]];
                     }
                     userInfo = [userInfo
                                 stringByAppendingString:
                                 [NSString stringWithFormat:@"Languages: %@\n\n",
                                  languageNames]];
                 }
                 
                 NSLog(@"%@",  userInfo); // Display the user info
                 
                 //Now show the maps view
                 [self presentViewController:[self.storyboard instantiateViewControllerWithIdentifier:@"rootViewController"] animated:YES completion:nil];

             }
         }];
    } else {
        //TODO: Ensure the login screen is displayed
    }
}

- (IBAction)loginButton:(id)sender {
    AppDelegate *appDelegate =
    [[UIApplication sharedApplication] delegate];
    
    // If the user is authenticated, log out when the button is clicked.
    // If the user is not authenticated, log in when the button is clicked.
    if (FBSession.activeSession.isOpen) {
        [appDelegate closeSession];
    } else {
        // The user has initiated a login, so call the openSession method
        // and show the login UX if necessary.
        [appDelegate openSessionWithAllowLoginUI:YES];
    }
}


@end
