//
//  ViewController.m
//  captureApp
//
//  Created by Howard Livingston on 5/20/14.
//  Copyright (c) 2014 Howard Livingston. All rights reserved.
//

//import the needed files
#import "ViewController.h"
#import "PictureViewController.h"
#import "VideoViewController.h"
#import "albumViewController.h"

//implement unique frameworks
#import <MobileCoreServices/MobileCoreServices.h>
#import <QuartzCore/QuartzCore.h>


@interface ViewController ()

@end

@implementation ViewController







- (void)viewDidLoad
{
    
        //Create view object for use with quarttz core
    UIImageView *itemImageView = (UIImageView *)ClapperImage;
        itemImageView.layer.borderWidth = 2.0f;
        itemImageView.layer.borderColor = [UIColor purpleColor].CGColor;
        itemImageView.layer.masksToBounds = NO;
        itemImageView.clipsToBounds = YES;
    
        self->ClapperImage.layer.cornerRadius = self->ClapperImage.frame.size.width / 2;
        self->ClapperImage.clipsToBounds = YES;
    
    
    
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}



#pragma album
-(IBAction)viewAlbum:(UIButton*)sender
{
    
    
    
//      Initialize the picker control
        UIImagePickerController *pickerControl = [[UIImagePickerController alloc] init];
        
            if (pickerControl != nil)
            {
//              Designate where the images are coming from, declaring t-control as the delegate
                
                pickerControl.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
                pickerControl.delegate = self;
                pickerControl.allowsEditing = true;
                
//              Present the album view
                [self presentViewController:pickerControl animated:true completion:nil];
                
            }
        
    
}


#pragma imagePickers

- (void)imagePickerController:(UIImagePickerController *)pickerControl didFinishPickingMediaWithInfo:(NSDictionary *)info
    {
//      Creating image objects
        
        UIImage *selectedImage = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
        UIImage *editedImage = [info objectForKey:@"UIImagePickerControllerEditedImage"];
        
            if (selectedImage != nil && editedImage != nil)
            {
                photoPickerBaseImage.image = selectedImage;
                editedPickerBaseImage.image = editedImage;
            }
        
//      Saving both the original and saved versions for this assignment
        
        UIImageWriteToSavedPhotosAlbum(selectedImage, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
        UIImageWriteToSavedPhotosAlbum(editedImage, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
                
        
//      Dismiss the view when done
        [pickerControl dismissViewControllerAnimated:true completion:nil];
        
    }
    
    
    
    -(void)image:(UIImage *)image didFinishSavingWithError:(NSError *) error contextInfo: (void *) contextInfo
        
    
    {
        
        
    }



#pragma segues

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender

{
}




-(IBAction)done:(UIStoryboardSegue*)segue
{
    
    
}









- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
