//
//  MenuViewController.m
//  barfinder
//
//  Created by Stephen Richter on 2/28/2014.
//  Copyright (c) 2014 Millennial Group. All rights reserved.
//

#import "MenuViewController.h"

@interface MenuViewController ()

@end

@implementation MenuViewController
@synthesize menuTable;

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
    
    UIImageView* tempImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg-menu.png"]];
    [tempImageView setFrame:self.menuTable.frame];
    self.menuTable.backgroundView = tempImageView;
	// Do any additional setup after loading the view.
    
}





#pragma mark Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return 6;
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    switch ([indexPath row]) {
        case 0:
            cell.textLabel.text = @"Home";
            break;
        case 1:
            cell.textLabel.text = @"Profile";
            break;
        case 2:
            cell.textLabel.text = @"Buddies";
        
            break;
        case 3:
            cell.textLabel.text = @"Places";
            break;
        case 4:
            cell.textLabel.text = @"Achievements";
            break;
        case 5:
            cell.textLabel.text = @"Logout";
            break;
    }
    cell.textLabel.font = [UIFont fontWithName:@"Helvetica" size:15];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    NSString *cellText = cell.textLabel.text;
    if ([cellText isEqualToString:@"Home"]) {
        [self.sidePanelController setCenterPanel:[self.storyboard instantiateViewControllerWithIdentifier:@"mapView"]];
    } else if ([cellText isEqualToString:@"Profile"]) {
        [self.sidePanelController setCenterPanel:[self.storyboard instantiateViewControllerWithIdentifier:@"profileView"]];
    } else if ([cellText isEqualToString:@"Buddies"]) {

    } else if ([cellText isEqualToString:@"Places"]) {

    } else if ([cellText isEqualToString:@"Achievements"]) {

    } else if ([cellText isEqualToString:@"Logout"]) {

    }

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
