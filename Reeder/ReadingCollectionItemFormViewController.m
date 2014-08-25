//
//  AddReadingCollectionItemFormViewController.m
//  Reeder
//
//  Created by Philip Nichols on 8/20/14.
//  Copyright (c) 2014 Phil Nichols. All rights reserved.
//

#import "ReadingCollectionItemFormViewController.h"
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

@interface ReadingCollectionItemFormViewController () <RETableViewManagerDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property (strong, nonatomic, readwrite) ReadingCollectionItem *addedReadingCollectionItem;

@property (strong, nonatomic) UIImagePickerController *imagePickerController;

@property (strong, nonatomic) RETableViewManager *manager;
@property (strong, nonatomic, readwrite) ReadingCollectionItemForm *readingCollectionItemForm;

@end

@implementation ReadingCollectionItemFormViewController

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

- (void)setReadingCollectionItem:(ReadingCollectionItem *)readingCollectionItem
{
    _readingCollectionItem = readingCollectionItem;
    
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
    if (self.readingCollectionItem) {
        self.navigationItem.leftBarButtonItem = nil;
        if ([self.readingCollectionItem isKindOfClass:[Book class]]) {
            self.type = ReadingCollectionItemTypeBook;
        } else if ([self.readingCollectionItem isKindOfClass:[EBook class]]) {
            self.type = ReadingCollectionItemTypeEBook;
        }
    } else {
        self.title = [NSString stringWithFormat:@"Add %@", [ReadingCollectionItem stringFromType:self.type]];
    }
    
    switch (self.type) {
        case ReadingCollectionItemTypeBook:
            self.readingCollectionItemForm = [[BookForm alloc] initWithBook:(Book *)self.readingCollectionItem];
            break;
            
        case ReadingCollectionItemTypeEBook:
            self.readingCollectionItemForm = [[EBookForm alloc] initWithEBook:(EBook *)self.readingCollectionItem];
            break;
    }
    
    [self.readingCollectionItemForm configureWithManager:self.manager];
    
    __weak typeof(self) weakSelf = self;
    
    self.readingCollectionItemForm.customImageItem.selectionHandler = ^(RECustomImageItem *item) {
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
    if ([identifier isEqualToString:ReadingCollectionItemSavedSegueIdentifier]) {
        // TODO: Add validation
    }
    
    return [super shouldPerformSegueWithIdentifier:identifier sender:sender];
}

#pragma mark - UIImagePickerControllerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    self.readingCollectionItemForm.customImageItem.customImage = info[UIImagePickerControllerOriginalImage];
    self.readingCollectionItemForm.changedImage = YES;
    [self.readingCollectionItemForm.customImageItem reloadRowWithAnimation:UITableViewRowAnimationNone];
    
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
