//
//  UIImagePickerController+ActionSheet.m
//  Reeder
//
//  Created by Philip Nichols on 8/22/14.
//  Copyright (c) 2014 Phil Nichols. All rights reserved.
//

#import "UIImagePickerController+ActionSheet.h"
#import "SIActionSheet+Convenience.h"

@implementation UIImagePickerController (ActionSheet)

- (void)presentWithActionSheetWithViewController:(UIViewController *)viewController
{
    SIActionSheetHandlerBlock photoLibraryHandler = ^(SIActionSheet *actionSheet) {
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
            self.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            [viewController presentViewController:self animated:YES completion:nil];
        } else {
            SIAlertView *alertView = [[SIAlertView alloc] initWithTitle:@"Photo Library Unavailable"
                                                             andMessage:@"It looks like your Photo Library isn't available. We're sorry about that."];
            
            [alertView addButtonWithTitle:@"OK"
                                     type:SIAlertViewButtonTypeDefault
                                  handler:nil];
            
            alertView.transitionStyle = SIAlertViewTransitionStyleFade;
            alertView.buttonsListStyle = SIAlertViewButtonsListStyleNormal;
            alertView.backgroundStyle = SIAlertViewBackgroundStyleSolid;
            
            [alertView show];
        }
    };
    SIActionSheetHandlerBlock savedPhotosHandler = ^(SIActionSheet *actionHandler) {
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeSavedPhotosAlbum]) {
            self.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
            [viewController presentViewController:self animated:YES completion:nil];
        } else {
            SIAlertView *alertView = [[SIAlertView alloc] initWithTitle:@"Saved Photos Unavailable"
                                                             andMessage:@"It looks like your Saved Photos Album isn't available. We're sorry about that."];
            
            [alertView addButtonWithTitle:@"OK"
                                     type:SIAlertViewButtonTypeDefault
                                  handler:nil];
            
            alertView.transitionStyle = SIAlertViewTransitionStyleFade;
            alertView.buttonsListStyle = SIAlertViewButtonsListStyleNormal;
            alertView.backgroundStyle = SIAlertViewBackgroundStyleSolid;
            
            [alertView show];
        }
    };
    SIActionSheetHandlerBlock takePhotoHandler = ^(SIActionSheet *actionSheet) {
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
            self.sourceType = UIImagePickerControllerSourceTypeCamera;
            [viewController presentViewController:self animated:YES completion:nil];
        } else {
            SIAlertView *alertView = [[SIAlertView alloc] initWithTitle:@"Camera Unavailable"
                                                             andMessage:@"It looks like your Camera isn't available. We're sorry about that."];
            
            [alertView addButtonWithTitle:@"OK"
                                     type:SIAlertViewButtonTypeDefault
                                  handler:nil];
            
            alertView.transitionStyle = SIAlertViewTransitionStyleFade;
            alertView.buttonsListStyle = SIAlertViewButtonsListStyleNormal;
            alertView.backgroundStyle = SIAlertViewBackgroundStyleSolid;
            
            [alertView show];
        }
    };
    
    NSDictionary *buttonHandlers = @{
                                     @"Photo Library" : photoLibraryHandler,
                                     @"Saved Photos" : savedPhotosHandler,
                                     @"Take Photo" : takePhotoHandler
                                     };
    
    [[SIActionSheet actionSheetWithTitle:@"Add Image"
                            buttonTitles:@[@"Photo Library", @"Saved Photos", @"Take Photo"]
                          buttonHandlers:buttonHandlers
                           cancelHandler:nil] show];
}

@end
