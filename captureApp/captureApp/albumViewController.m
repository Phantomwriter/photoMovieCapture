//
//  albumViewController.m
//  captureApp
//
//  Created by Howard Livingston on 5/20/14.
//  Copyright (c) 2014 Howard Livingston. All rights reserved.
//

#import "albumViewController.h"
#import <MobileCoreServices/MobileCoreServices.h>

@interface albumViewController ()

@end

@implementation albumViewController



- (void)viewDidLoad
{
    
   
   
   UIImagePickerController *pickerControl = [[UIImagePickerController alloc] init];
   
   if (pickerControl != nil)
   {
   //cb=hange Sourcetypr=e to    SourcetypeCamera
   pickerControl.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
   //UIImagePickerControllerSourceTypePhotoLibrary;
   pickerControl.delegate = self;
   pickerControl.allowsEditing = true;
   //Present the view controller
   [self presentViewController:pickerControl animated:true completion:nil];
   
   }
  
   
   
   
   
   
  

    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


//Jump to definition on UIimagrPickerController-grab this
- (void)imagePickerController:(UIImagePickerController *)pickerControl didFinishPickingMediaWithInfo:(NSDictionary *)info



{
    
    
    
    
    UIImage *selectedImage = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
    UIImage *editedImage = [info objectForKey:@"UIImagePickerControllerEditedImage"];
    if (selectedImage != nil && editedImage != nil)
    {
        //photoPickerBaseImage.image = selectedImage;
        //editedPickerBaseImage.image = editedImage;
    }
    
    
    
    /*UIImage *selectedImage = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
     if (selectedImage != nil)
     {
     photoPickerBaseImage.image = selectedImage;
     }
     
     UIImage *editedImage = [info objectForKey:@"UIImagePickerControllerEditedImage"];
     if (editedImage != nil)
     {
     editedPickerBaseImage.image = editedImage;
     }*/
    
    
    //
    UIImageWriteToSavedPhotosAlbum(selectedImage, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
    
    // to save camera image to album add this
    UIImageWriteToSavedPhotosAlbum(editedImage, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
    [pickerControl dismissViewControllerAnimated:true completion:nil];
    
    
    //NSLog(@"info=%@", info);
}





-(void)image:(UIImage *)image didFinishSavingWithError:(NSError *) error contextInfo: (void *) contextInfo

{
    
    
}









- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}



@end
