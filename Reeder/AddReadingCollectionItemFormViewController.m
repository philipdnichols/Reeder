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

@interface AddReadingCollectionItemFormViewController () <RETableViewManagerDelegate>

@property (strong, nonatomic, readwrite) ReadingCollectionItem *addedReadingCollectionItem;

@property (strong, nonatomic) RETableViewManager *manager;

@property (strong, nonatomic) RETextItem *titleItem;
@property (strong, nonatomic) REDateTimeItem *publishedDateItem;
@property (strong, nonatomic) REPickerItem *ratingItem;

@property (strong, nonatomic) RELongTextItem *detailsItem;

@property (strong, nonatomic) RELongTextItem *notesItem;

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
    self.title = [NSString stringWithFormat:@"Add %@", self.type];
    
    [self.manager removeAllSections];
    
    RETableViewSection *section = [RETableViewSection section];
    RETableViewSection *detailsSection = [RETableViewSection sectionWithHeaderTitle:@"Details"];
    RETableViewSection *notesSection = [RETableViewSection sectionWithHeaderTitle:@"Notes"];
    
    self.titleItem = [RETextItem itemWithTitle:@"Title" value:nil];
    self.publishedDateItem = [REDateTimeItem itemWithTitle:@"Published Date"
                                                     value:[NSDate date]
                                               placeholder:nil
                                                    format:@"MM/dd/yyyy"
                                            datePickerMode:UIDatePickerModeDate];
//    self.ratingItem = [REPickerItem itemWithTitle:@"Rating"
//                                            value:nil
//                                      placeholder:nil
//                                          options:@[@"1"]];
    
    self.ratingItem = [REPickerItem itemWithTitle:@"Rating"
                                            value:nil
                                      placeholder:nil options:@[@[@"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10"]]];

    
    self.detailsItem = [RELongTextItem item];
    self.detailsItem.cellHeight = 88;
    
    self.notesItem = [RELongTextItem item];
    self.notesItem.cellHeight = 88;
    
    [section addItem:self.titleItem];
    [section addItem:self.publishedDateItem];
    [section addItem:self.ratingItem];
    
    [detailsSection addItem:self.detailsItem];
    
    [notesSection addItem:self.notesItem];
    
    [self.manager addSection:section];
    [self.manager addSection:detailsSection];
    [self.manager addSection:notesSection];
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
            book.title = self.titleItem.value;
            book.publishedDate = self.publishedDateItem.value;
            book.rating = @([(NSString *)[self.ratingItem.value firstObject] integerValue]);
            
            book.details = self.detailsItem.value;
            
            book.notes = self.notesItem.value;
            
            self.addedReadingCollectionItem = book;
        } else if ([self.type isEqualToString:@"E-Book"]) {
            EBook *ebook = [EBook MR_createEntity];
            ebook.title = self.titleItem.value;
            ebook.publishedDate = self.publishedDateItem.value;
            ebook.rating = @([(NSString *)[self.ratingItem.value firstObject] integerValue]);
            
            ebook.details = self.detailsItem.value;
            
            ebook.notes = self.notesItem.value;
            
            self.addedReadingCollectionItem = ebook;
        }
    }
}

@end
