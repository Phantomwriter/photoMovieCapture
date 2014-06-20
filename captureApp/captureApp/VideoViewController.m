//
//  VideoViewController.m
//  captureApp
//
//  Created by Howard Livingston on 5/21/14.
//  Copyright (c) 2014 Howard Livingston. All rights reserved.
//

#import "VideoViewController.h"
#import <MobileCoreServices/MobileCoreServices.h>


//     this view opens when the video is selected, the video starts automatically


@interface VideoViewController ()

@end

@implementation VideoViewController



- (void)viewDidLoad
{
    //image object for quartz core
    UIImageView *itemImageView = (UIImageView *)videoTitleImage;
        itemImageView.layer.borderWidth = 2.0f;
        itemImageView.layer.borderColor = [UIColor purpleColor].CGColor;
        itemImageView.layer.masksToBounds = NO;
        itemImageView.clipsToBounds = YES;
    
        self->videoTitleImage.layer.cornerRadius = self->videoTitleImage.frame.size.width / 2;
        self->videoTitleImage.clipsToBounds = YES;
    
    
   
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


//When the view loads, the camera turns on
-(void)viewDidAppear:(BOOL)animated
{
 
//  Allocate and initialize the picker
    UIImagePickerController *pickerControl = [[UIImagePickerController alloc] init];
 
        if ((pickerControl != nil) && (!didShow))
        {
            
//          establish source type
            pickerControl.sourceType = UIImagePickerControllerSourceTypeCamera;
            pickerControl.delegate = self;
            pickerControl.allowsEditing = true;

//          Establish that it's a movie, put in array
            pickerControl.mediaTypes = [NSArray arrayWithObjects: (NSString *) kUTTypeMovie, nil];

//          Present the view controller
            [UIImagePickerController availableMediaTypesForSourceType:UIImagePickerControllerSourceTypeSavedPhotosAlbum];
            [self presentViewController:pickerControl animated:true completion:nil];
            
           
 
 }
 //keep view from reloading
didShow = YES;
 
 
 }
 



-(IBAction)saveVideo:(UIButton*)sender
{



// save to album, but it doesnt save, The info is there (NSLog) but I cant get it to save
    UISaveVideoAtPathToSavedPhotosAlbum(_mediaTypes, self, nil, nil);

    

 
    
    
          


}







 // Creating the object strings for the viseos, saving the video and letting the user know what's going on
 
 - (void)imagePickerController:(UIImagePickerController *)pickerControl didFinishPickingMediaWithInfo:(NSDictionary *)info
 
 {
 
//      Change the url to a string
         //NSLog(@"Here comes the video",pathString);
     

     
 
 //     If the user saves, save the video to the album
 
     [pickerControl dismissViewControllerAnimated:true completion:nil];
 
     
     NSString *mediaType = [info objectForKey:UIImagePickerControllerMediaType];
      if ([mediaType isEqualToString:@"public.movie"]){
     
          // Saving the video
     _pathString = [[info objectForKey:@"UIImagePickerControllerMediaURL"]relativePath];

      
 
    }
 }


 -(void)video:(NSString*) videoPath didFinishSavingWithError:(NSError *) error contextInfo: (void *) contextInfo
 
 
 
 {
 

     if (error == nil)
     
     {

         //             Alert the user that their changes were saved
         UIAlertView *planAlert = [[UIAlertView alloc]initWithTitle:@"Success!" message:@"Your video is saved!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
         
         [planAlert show];

     }
     else
//Issue a warning that something went wrong
     {
         UIAlertView *planAlert = [[UIAlertView alloc]initWithTitle:@"There was an error!" message:@"Please start over" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
         
         [planAlert show];
     
     
     }

 
 }







- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
