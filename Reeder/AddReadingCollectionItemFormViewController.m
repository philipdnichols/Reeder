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

@interface AddReadingCollectionItemFormViewController ()

@property (strong, nonatomic, readwrite) ReadingCollectionItem *addedReadingCollectionItem;

@end

@implementation AddReadingCollectionItemFormViewController

#pragma mark - Properties

- (void)setType:(NSString *)type
{
    _type = type;
    
    if (self.view.window) {
        [self updateUI];
    }
}

#pragma mark - Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self updateUI];
}

- (void)updateUI
{
    self.title = [NSString stringWithFormat:@"Add %@", self.type];
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
        // TODO: this
        // TODO: no hardcoded
        if ([self.type isEqualToString:@"Book"]) {
            Book *book = [Book MR_createEntity];
            book.title = @"Test Book";
            book.detail = @"Test Book";
            
            self.addedReadingCollectionItem = book;
        } else if ([self.type isEqualToString:@"E-Book"]) {
            EBook *ebook = [EBook MR_createEntity];
            ebook.title = @"Test E-Book";
            ebook.detail = @"Test E-Book";
            
            self.addedReadingCollectionItem = ebook;
        }
    }
}

@end
