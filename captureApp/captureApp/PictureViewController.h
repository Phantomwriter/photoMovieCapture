//
//  PictureViewController.h
//  captureApp
//
//  Created by Howard Livingston on 5/21/14.
//  Copyright (c) 2014 Howard Livingston. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PictureViewController : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate>


//  This file is when the camera option is selected,the view changes to this & starts the camera.


{

    
//  viewDidAppearTamer 
    BOOL didShow;
    
    
    
//  These are the outlets for the images taken by the camera
    IBOutlet UIImageView *picHolder;
    IBOutlet UIImageView *editedPicHolder;
    
    
//  image declared to use with quartz core
    IBOutlet UIImageView *pictureTitleImage;

//  These are the buttons to either save the image, or dismiss and do nothing
    UIButton *saveCameraPic;
    IBOutlet UIButton *cancelSave;


}

//properties
@property (nonatomic, strong)UIImage *selectedImage;
@property (nonatomic, strong)UIImage *editedImage;
@property (nonatomic, strong)NSString *bothImages;


//This action will save the image to the album
-(IBAction)picSaveClick:(UIButton*)sender;


@end
