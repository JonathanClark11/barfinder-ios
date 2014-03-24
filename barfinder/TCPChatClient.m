//
//  TCPChatClient.m
//  barfinder
//
//  Created by Jonathan Clark on 2014-03-24.
//  Copyright (c) 2014 Millennial Group. All rights reserved.
//

#import "TCPChatClient.h"

@implementation TCPChatClient
@synthesize inputStream, outputStream;
@synthesize _room;
- (id)init {
    return [self initWithNetwork];
}


- (id)initWithNetwork {
    CFReadStreamRef readStream;
    CFWriteStreamRef writeStream;
    CFStreamCreatePairWithSocketToHost(NULL, (CFStringRef)@"localhost", 80, &readStream, &writeStream);
    inputStream = (__bridge NSInputStream *)readStream;
    outputStream = (__bridge NSOutputStream *)writeStream;
    
    [inputStream setDelegate:self];
    [outputStream setDelegate:self];
    
    [inputStream scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    [outputStream scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    
    [inputStream open];
    [outputStream open];
    return self;
}

- (void)joinChat:(NSString*)name {
	[self sendCommand:[NSString stringWithFormat:@"iam:%@\r\n", name]];
}

- (void)createRoom:(NSString*)room {
    _room = room;
	[self sendCommand:[NSString stringWithFormat:@"new:%@\r\n", _room]];
}

- (void)joinRoom:(NSString*)room {
    _room = room;
	[self sendCommand:[NSString stringWithFormat:@"enter:%@\r\n", _room]];
}

- (void)sendMessage:(NSString*)message {
	[self sendCommand:[NSString stringWithFormat:@"msg:%@:%@\r\n", _room, message]];
}

- (void)sendCommand:(NSString*)command {
    NSData *data = [[NSData alloc] initWithData:[command dataUsingEncoding:NSASCIIStringEncoding]];
	[outputStream write:[data bytes] maxLength:[data length]];
}

// Handle Stream Events
- (void)stream:(NSStream *)theStream handleEvent:(NSStreamEvent)streamEvent {
	switch (streamEvent) {
            
		case NSStreamEventOpenCompleted:
			NSLog(@"Stream opened");
			break;
        
        case NSStreamEventHasSpaceAvailable:
            NSLog(@"Stream buffer space available");
            break;
		
        case NSStreamEventHasBytesAvailable:
            
            if (theStream == inputStream) {
                
                uint8_t buffer[1024];
                int len;
                
                while ([inputStream hasBytesAvailable]) {
                    len = [inputStream read:buffer maxLength:sizeof(buffer)];
                    if (len > 0) {
                        
                        NSString *output = [[NSString alloc] initWithBytes:buffer length:len encoding:NSASCIIStringEncoding];
                        
                        if (nil != output) {
                            NSLog(@"server said: %@", output);
                            if ([output rangeOfString:@"msg"].location != NSNotFound) {
                                [self.delegate messageReceived:output];
                            }
                        }
                    }
                }
            }
            break;
            
		case NSStreamEventErrorOccurred:
			NSLog(@"Can not connect to the host!");
			break;
            
		case NSStreamEventEndEncountered:
            
            [theStream close];
            [theStream removeFromRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
            
			break;
            
		default:
			NSLog(@"Unknown event");
            break;
	}
    
}

@end
