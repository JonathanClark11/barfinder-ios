//
//  TCPChatClient.h
//  barfinder
//
//  Created by Jonathan Clark on 2014-03-24.
//  Copyright (c) 2014 Millennial Group. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSMessage.h"
@protocol ChatResponseDelegate <NSObject>
@required
- (void) messageReceived:(NSString*)message;
@end
@interface TCPChatClient : NSObject <NSStreamDelegate> {
    NSInputStream *inputStream;
    NSOutputStream *outputStream;
    
    id<ChatResponseDelegate> _delegate;
    NSString *_room;
}
@property(nonatomic,retain) NSInputStream * inputStream;
@property(nonatomic,retain) NSOutputStream * outputStream;
@property (nonatomic,strong) id delegate;
@property(nonatomic,retain) NSString* _room;


- (id)initWithNetwork;
- (void)joinChat:(NSString*)name;
- (void)createRoom:(NSString*)room;
- (void)joinRoom:(NSString*)room;
- (void)sendMessage:(NSString*)message;

@end
