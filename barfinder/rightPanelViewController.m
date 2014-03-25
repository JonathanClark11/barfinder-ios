//
//  rightPanelViewController.m
//  barfinder
//
//  Created by Jonathan Clark on 2014-03-24.
//  Copyright (c) 2014 Millennial Group. All rights reserved.
//

#import "rightPanelViewController.h"

@implementation rightPanelViewController
@synthesize chatroomTable;

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
	// Do any additional setup after loading the view.
    
}





#pragma mark Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return 3;
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
            cell.textLabel.text = @"Chatroom 1";
            cell.textLabel.textAlignment = NSTextAlignmentRight;
            break;
        case 1:
            cell.textLabel.text = @"Chatroom 2";
            cell.textLabel.textAlignment = NSTextAlignmentRight;
            break;
        case 2:
            cell.textLabel.text = @"Chatroom 3";
            cell.textLabel.textAlignment = NSTextAlignmentRight;
            break;
    }
    cell.textLabel.font = [UIFont fontWithName:@"Helvetica" size:15];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    NSString *cellText = cell.textLabel.text;
    //TODO: ENTER CHATROOM
    //check chatroom id and open the jsmessages view
    [self.sidePanelController setCenterPanel:[self.storyboard instantiateViewControllerWithIdentifier:@"chatroomView"]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
