//
//  MenuViewController.h
//  barfinder
//
//  Created by Stephen Richter on 2/28/2014.
//  Copyright (c) 2014 Millennial Group. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JASidePanelController.h"
#import "UIViewController+JASidePanel.h"
#import "MenuDelegate.h"

#import "ProfileViewController.h"
#import "MapViewController.h"

@interface MenuViewController : UIViewController <UITableViewDelegate, UITableViewDataSource> {
    IBOutlet UITableView* menuTable;
}
@property (weak, nonatomic)  id <MenuDelegate> menuDelegate;
@property (nonatomic, retain) UITableView* menuTable;
@end
