//
//  ChatViewController.m
//  barfinder
//
//  Created by Jonathan Clark on 2014-03-24.
//  Copyright (c) 2014 Millennial Group. All rights reserved.
//

#import "ChatViewController.h"

@interface ChatViewController ()

@end

@implementation ChatViewController
@synthesize conn;

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
    // Do any additional setup after loading the view.
    self.conn = [[TCPChatClient alloc] init];
    self.conn.delegate = self;
    
    //DEBUGGING
    //Join the chatroom
    [self.conn joinChat:@"Jon"];
    //join the room
    [self.conn joinRoom:@"Nightclub"];
    
    //set your vc as teh delegate and datasource
    self.delegate = self;
    self.dataSource = self;
    
    [super viewDidLoad];
    
//    [[JSBubbleView appearance] setFont:/* your font for the message bubbles */];
    
    self.title = @"Chatroom";
    self.messageInputView.textView.placeHolder = @"Message";
    self.sender = @"User";
    self.messages = [[NSMutableArray alloc] init];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.messages.count;
}

#pragma mark JSMessagesViewDelegate

- (void)didSendText:(NSString *)text fromSender:(NSString *)sender onDate:(NSDate *)date {
    [self.conn sendMessage:text];
    [self.messages addObject:[[JSMessage alloc] initWithText:text sender:sender date:date]];
    [self finishSend];
    [self scrollToBottomAnimated:YES];
}
- (JSBubbleMessageType)messageTypeForRowAtIndexPath:(NSIndexPath *)indexPath {
    return JSBubbleMessageTypeIncoming;
}

- (UIImageView *)bubbleImageViewWithType:(JSBubbleMessageType)type
                       forRowAtIndexPath:(NSIndexPath *)indexPath
{
//    if ([self.sender isEqualToString:[[self.messages  objectAtIndex:indexPath] sender]]) {
//        return [JSBubbleImageViewFactory bubbleImageViewForType:type
//                                                          color:[UIColor js_bubbleLightGrayColor]];
//    }
    
    return [JSBubbleImageViewFactory bubbleImageViewForType:type
                                                      color:[UIColor js_bubbleBlueColor]];
}
- (JSMessageInputViewStyle)inputViewStyle {
    return JSMessageInputViewStyleFlat;
}


#pragma mark jsmessagesview data source
- (id<JSMessageData>)messageForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [self.messages objectAtIndex:indexPath.row];
}
- (UIImageView *)avatarImageViewForRowAtIndexPath:(NSIndexPath *)indexPath sender:(NSString *)sender{
//    UIImage *image = [self.avatars objectForKey:sender];
    return [[UIImageView alloc] initWithImage:nil];
}


#pragma mark - ChatResponse delegate
-(void)messageReceived:(NSString *)message{
    NSArray* responseArray = [[NSArray alloc] init];
    responseArray = [message componentsSeparatedByString:@":"];
    NSString* from = [responseArray objectAtIndex:1];
    NSString* room = [responseArray objectAtIndex:2];
    NSString* text = [responseArray objectAtIndex:3];
    if ([self.sender isEqualToString:from] == false) {
        [self.messages addObject:[[JSMessage alloc] initWithText:text sender:from date:[NSDate date]]];
        [self.tableView reloadData];
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

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self scrollToBottomAnimated:NO];
}

@end
