//
//  AddReadingCollectionItemFormViewController.m
//  Reeder
//
//  Created by Philip Nichols on 8/20/14.
//  Copyright (c) 2014 Phil Nichols. All rights reserved.
//

#import "AddReadingCollectionItemFormViewController.h"
#import "Book.h"
#import "EBook.h"
#import "Author.h"
#import "ReadingCollectionItemTag.h"
#import "UIImage+IO.h"
#import "ReadingCollectionItemForm.h"
#import "RECustomImageItem.h"
#import "SIActionSheet+Convenience.h"
#import "UIImagePickerController+ActionSheet.h"
#import "BookForm.h"
#import "EBookForm.h"
#import "Book+Form.h"
#import "EBook+Form.h"

@interface AddReadingCollectionItemFormViewController () <RETableViewManagerDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property (strong, nonatomic, readwrite) ReadingCollectionItem *addedReadingCollectionItem;

@property (strong, nonatomic) UIImagePickerController *imagePickerController;

@property (strong, nonatomic) RETableViewManager *manager;
@property (strong, nonatomic) ReadingCollectionItemForm *form;

@end

@implementation AddReadingCollectionItemFormViewController

#pragma mark - Properties

- (UIImagePickerController *)imagePickerController
{
    if (!_imagePickerController) {
        _imagePickerController = [[UIImagePickerController alloc] init];
        _imagePickerController.delegate = self;
        _imagePickerController.navigationController.navigationBar.translucent = NO;
    }
    return _imagePickerController;
}

- (void)setType:(ReadingCollectionItemType)type
{
    _type = type;
    
    if (self.view.window) {
        [self updateUI];
    }
}

- (RETableViewManager *)manager
{
    if (!_manager) {
        _manager = [[RETableViewManager alloc] initWithTableView:self.tableView
                                                        delegate:self];
    }
    return _manager;
}

#pragma mark - Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self updateUI];
}

- (void)updateUI
{
    self.title = [NSString stringWithFormat:@"Add %@", [ReadingCollectionItem stringFromType:self.type]];
    
    switch (self.type) {
        case ReadingCollectionItemTypeBook:
            self.form = [[BookForm alloc] init];
            break;
            
        case ReadingCollectionItemTypeEBook:
            self.form = [[EBookForm alloc] init];
            break;
    }
    
    [self.form configureWithManager:self.manager];
    
    __weak typeof(self) weakSelf = self;
    
    self.form.customImageItem.selectionHandler = ^(RECustomImageItem *item) {
        [weakSelf.imagePickerController presentWithActionSheetWithViewController:weakSelf];
        
        [item deselectRowAnimated:YES];
    };
}

#pragma mark - IBActions

- (IBAction)cancelButtonTapped
{
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Navigation

- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender
{
    if ([identifier isEqualToString:ReadingCollectionItemAddedSegueIdentifier]) {
        // TODO: Add validation
    }
    
    return [super shouldPerformSegueWithIdentifier:identifier sender:sender];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:ReadingCollectionItemAddedSegueIdentifier]) {
        switch (self.type) {
            case ReadingCollectionItemTypeBook: {
                self.addedReadingCollectionItem = [Book createWithForm:(BookForm *)self.form];
                break;
            }
                
            case ReadingCollectionItemTypeEBook:
                self.addedReadingCollectionItem = [EBook createWithForm:(EBookForm *)self.form];
                break;
        }
    }
}

#pragma mark - UIImagePickerControllerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    self.form.customImageItem.customImage = info[UIImagePickerControllerOriginalImage];
    [self.form.customImageItem reloadRowWithAnimation:UITableViewRowAnimationNone];
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
}

#pragma mark - UINavigationControllerDelegate

- (void)navigationController:(UINavigationController *)navigationController
      willShowViewController:(UIViewController *)viewController
                    animated:(BOOL)animated
{
    // Hack to fix the UIImagePickerController messing up the status bar style
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
    
    if ([navigationController isKindOfClass:[UIImagePickerController class]]) {
        viewController.navigationController.navigationBar.translucent = NO;
        viewController.edgesForExtendedLayout = UIRectEdgeNone;
    }
}

@end
