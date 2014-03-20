//
//  MenuDelegate.h
//  barfinder
//
//  Created by Jonathan Clark on 2014-03-19.
//  Copyright (c) 2014 Millennial Group. All rights reserved.
//

#ifndef barfinder_MenuDelegate_h
#define barfinder_MenuDelegate_h

@protocol MenuDelegate <NSObject>
- (void) MenuItemSelected: (NSString*) item;
@end

#endif
