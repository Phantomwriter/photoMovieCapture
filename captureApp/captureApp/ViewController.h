//
//  ViewController.h
//  captureApp
//
//  Created by Howard Livingston on 5/20/14.
//  Copyright (c) 2014 Howard Livingston. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface ViewController : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate>

//  This file is for the main view. It also contains the code for the album which is displayed in this view


{
    
    
//  These are the outlets for reviewing the photos in the photo album that are taken or retrieved

    
    IBOutlet UIImageView * photoPickerBaseImage;
    IBOutlet UIImageView * editedPickerBaseImage;
    IBOutlet UIImageView *ClapperImage;
    
    
//  declare titleLabel for quartzCore effect
    IBOutlet UILabel *titleLabel;
    
    
//  Establish the buttons
    
    IBOutlet UIButton * movieButton;
    IBOutlet UIButton * cameraButton;
    IBOutlet UIButton * albumButton;

}


//   This brings up the users album

    -(IBAction)viewAlbum:(id)sender;






@end
