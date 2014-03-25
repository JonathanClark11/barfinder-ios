//
//  ChatViewController.h
//  barfinder
//
//  Created by Jonathan Clark on 2014-03-24.
//  Copyright (c) 2014 Millennial Group. All rights reserved.
//

#import "JSMessagesViewController.h"
#import "TCPChatClient.h"
#import "JSMessage.h"
@interface ChatViewController : JSMessagesViewController <JSMessagesViewDelegate, JSMessagesViewDataSource, ChatResponseDelegate>
@property(nonatomic,retain) TCPChatClient * conn;
@property (strong, nonatomic) NSMutableArray *messages;
@property (strong, nonatomic) NSDictionary *avatars;
@end
