//
//  VideoViewController.h
//  captureApp
//
//  Created by Howard Livingston on 5/21/14.
//  Copyright (c) 2014 Howard Livingston. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VideoViewController : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate>


//      this view opens when the video is selected, the video starts automatically



{
// to prevent the view from repeat loading after video is selected
    BOOL didShow;

//  This holds the video
    IBOutlet UIImage *videoHolder;
    IBOutlet UIImageView *videoTitleImage;
    
//  These are the buttons to either save the image, or dismiss and do nothing
    IBOutlet UIButton *saveVideo;
    IBOutlet UIButton *cancelSave;
    
    
}
//properties
@property (nonatomic, strong)NSString *pathString;
@property(nonatomic, strong)NSString *mediaTypes;

//This action will either save the video to the album, or allow a cancel and dismiss the view
-(IBAction)saveVideo:(UIButton*)sender;


@end


