//
//  ChatroomViewController.h
//  barfinder
//
//  Created by Stephen Richter on 2/21/2014.
//  Copyright (c) 2014 Millennial Group. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChatroomViewController : UIViewController <NSStreamDelegate, UITableViewDelegate, UITableViewDataSource> {
    
    NSInputStream *inputStream;
    NSOutputStream *outputStream;
    
    NSMutableArray *messages;
    
}

@property(nonatomic,retain) NSInputStream * inputStream;
@property(nonatomic,retain) NSOutputStream * outputStream;


- (void)initNetworkCommunication;
- (IBAction)joinChat:(id)sender;
- (IBAction)createRoom:(id)sender;
- (IBAction)joinRoom:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *inputMessageField;
@property (weak, nonatomic) IBOutlet UITableView *tView;
- (IBAction)sendMessage:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *chatView;

@property(assign) CGPoint originalCenter;


@end
