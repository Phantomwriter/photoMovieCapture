//
//  PictureViewController.m
//  captureApp
//
//  Created by Howard Livingston on 5/21/14.
//  Copyright (c) 2014 Howard Livingston. All rights reserved.
//


// files & frameworks
#import "PictureViewController.h"
#import <MobileCoreServices/MobileCoreServices.h>

@interface PictureViewController ()

@end

@implementation PictureViewController


- (void)viewDidLoad

    {
//      create image object for quartz core
        UIImageView *itemImageView = (UIImageView *)pictureTitleImage;
            itemImageView.layer.borderWidth = 2.0f;
            itemImageView.layer.borderColor = [UIColor purpleColor].CGColor;
            itemImageView.layer.masksToBounds = NO;
            itemImageView.clipsToBounds = YES;
    
            self->pictureTitleImage.layer.cornerRadius = self->pictureTitleImage.frame.size.width / 2;
            self->pictureTitleImage.clipsToBounds = YES;

    
    
       [super viewDidLoad];
}





//  When the view appears, the camera will turn on

-(void)viewDidAppear:(BOOL)animated

{

//      Initialize the picker control
        UIImagePickerController *pickerControl = [[UIImagePickerController alloc] init];

//          If all's good, start up the camera
            if (!didShow)
            {
                pickerControl.sourceType = UIImagePickerControllerSourceTypeCamera;
                pickerControl.delegate = self;
                pickerControl.allowsEditing = true;
                
                

//              Camera turns on
                [self presentViewController:pickerControl animated:true completion:nil];
        
        
            }
// this is so the view doesnt keep loading
    didShow = YES;
}


// Creating the objects for the images, saving the images and letting the user know what's going on

- (void)imagePickerController:(UIImagePickerController *)pickerControl didFinishPickingMediaWithInfo:(NSDictionary *)info
 
{
//          When finished, access the stored images
            _selectedImage = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
            _editedImage = [info objectForKey:@"UIImagePickerControllerEditedImage"];
    

//              if everythings okay......
                if (_selectedImage != nil && _editedImage != nil)
                
//              assign the images to the properties
                {
                    picHolder.image = _selectedImage;
                    editedPicHolder.image = _editedImage;
                    
//              allow edting and create the delegate
                    pickerControl.delegate = self;
                    pickerControl.allowsEditing = true;
                }
    
    

    [pickerControl dismissViewControllerAnimated:true completion:nil];
//                  If the user saves, save the images to the album
    
                   

}

//Event established
-(IBAction)picSaveClick:(UIButton*)sender

    {
         
//       Save both originl and edited images to the photo album
         UIImageWriteToSavedPhotosAlbum(_editedImage, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
         UIImageWriteToSavedPhotosAlbum(_selectedImage, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);

       

     }
 

-(void)image:(UIImage *)image didFinishSavingWithError:(NSError *) error contextInfo: (void *) contextInfo

//When saved (or not saved)alerts

{
    
    if (error == nil)
        
    {

        UIAlertView *planAlert = [[UIAlertView alloc]initWithTitle:@"SUCCESS!" message:@"You're picture was saved!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
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
