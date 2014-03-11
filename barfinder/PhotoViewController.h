//
//  PhotoViewController.h
//  barfinder
//
//  Created by Jonathan Clark on 2014-03-11.
//  Copyright (c) 2014 Millennial Group. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PhotoViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate> {
    UIImagePickerController *picker;
    UIImagePickerController *picker2;
    UIImage *image;
    IBOutlet UIImageView *imageView;
}
- (IBAction)TakePhoto;
- (IBAction)ChooseExisting;

@end
