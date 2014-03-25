//
//  rightPanelViewController.h
//  barfinder
//
//  Created by Jonathan Clark on 2014-03-24.
//  Copyright (c) 2014 Millennial Group. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JASidePanelController.h"
#import "UIViewController+JASidePanel.h"

@interface rightPanelViewController : UIViewController <UITableViewDelegate, UITableViewDataSource> {
    IBOutlet UITableView* chatroomTable;
}
@property (nonatomic, retain) UITableView* chatroomTable;
@end
