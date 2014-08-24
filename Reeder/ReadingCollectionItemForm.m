//
//  ReadingCollectionItemForm.m
//  Reeder
//
//  Created by Philip Nichols on 8/22/14.
//  Copyright (c) 2014 Phil Nichols. All rights reserved.
//

#import "ReadingCollectionItemForm.h"
#import "RECustomImageItem.h"

@interface ReadingCollectionItemForm ()

@property (strong, nonatomic, readwrite) RETableViewSection *imageSection;
@property (strong, nonatomic, readwrite) RETableViewSection *defaultSection;
@property (strong, nonatomic, readwrite) RETableViewSection *authorsSection;
@property (strong, nonatomic, readwrite) RETableViewSection *summarySection;
@property (strong, nonatomic, readwrite) RETableViewSection *tagsSection;
@property (strong, nonatomic, readwrite) RETableViewSection *notesSection;

@property (strong, nonatomic, readwrite) RECustomImageItem *customImageItem;
@property (strong, nonatomic, readwrite) RETextItem *titleItem;
@property (strong, nonatomic, readwrite) REDateTimeItem *publishedDateItem;
@property (strong, nonatomic, readwrite) REPickerItem *ratingItem;
@property (strong, nonatomic, readwrite) RELongTextItem *summaryItem;
@property (strong, nonatomic, readwrite) RELongTextItem *notesItem;
@property (strong, nonatomic, readwrite) RETableViewItem *addAuthorButton;
@property (strong, nonatomic, readwrite) RETableViewItem *addTagButton;

@property (strong, nonatomic, readwrite) NSMutableArray *authors; // of RETextItem
@property (strong, nonatomic, readwrite) NSMutableArray *tags; // of RETextItem

@end

@implementation ReadingCollectionItemForm

#pragma mark - Properties

- (RETableViewSection *)imageSection
{
    if (!_imageSection) {
        _imageSection = [RETableViewSection sectionWithHeaderTitle:@"Image"];
        [_imageSection addItem:self.customImageItem];
    }
    return _imageSection;
}

- (RETableViewSection *)defaultSection
{
    if (!_defaultSection) {
        _defaultSection = [RETableViewSection section];
        [_defaultSection addItem:self.titleItem];
        [_defaultSection addItem:self.publishedDateItem];
        [_defaultSection addItem:self.ratingItem];
    }
    return _defaultSection;
}

- (RETableViewSection *)authorsSection
{
    if (!_authorsSection) {
        _authorsSection = [RETableViewSection sectionWithHeaderTitle:@"Authors"];
        [self addAuthorTextItem:nil toSection:_authorsSection];
        [_authorsSection addItem:self.addAuthorButton];
    }
    return _authorsSection;
}

- (RETableViewSection *)summarySection
{
    if (!_summarySection) {
        _summarySection = [RETableViewSection sectionWithHeaderTitle:@"Summary"];
        [_summarySection addItem:self.summaryItem];
    }
    return _summarySection;
}

- (RETableViewSection *)tagsSection
{
    if (!_tagsSection) {
        _tagsSection = [RETableViewSection sectionWithHeaderTitle:@"Tags"];
        [_tagsSection addItem:self.addTagButton];
    }
    return _tagsSection;
}

- (RETableViewSection *)notesSection
{
    if (!_notesSection) {
        _notesSection = [RETableViewSection sectionWithHeaderTitle:@"Notes"];
        [_notesSection addItem:self.notesItem];
    }
    return _notesSection;
}

- (RECustomImageItem *)customImageItem
{
    if (!_customImageItem) {
        _customImageItem = [RECustomImageItem item];
    }
    return _customImageItem;
}

- (RETextItem *)titleItem
{
    if (!_titleItem) {
        _titleItem = [RETextItem itemWithTitle:@"Title"];
        _titleItem.autocapitalizationType = UITextAutocapitalizationTypeWords;
    }
    return _titleItem;
}

- (REDateTimeItem *)publishedDateItem
{
    if (!_publishedDateItem) {
        _publishedDateItem = [REDateTimeItem itemWithTitle:@"Published Date"
                                                     value:nil
                                               placeholder:nil
                                                    format:@"MM/dd/yyyy"
                                            datePickerMode:UIDatePickerModeDate];
        _publishedDateItem.maximumDate = [NSDate date];
    }
    return _publishedDateItem;
}

- (REPickerItem *)ratingItem
{
    if (!_ratingItem) {
        _ratingItem = [REPickerItem itemWithTitle:@"Rating"
                                            value:nil
                                      placeholder:nil
                                          options:@[@[@"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10"]]];
    }
    return _ratingItem;
}

- (RELongTextItem *)summaryItem
{
    if (!_summaryItem) {
        _summaryItem = [RELongTextItem item];
        _summaryItem.cellHeight = 88;
        _summaryItem.autocapitalizationType = UITextAutocapitalizationTypeSentences;
    }
    return _summaryItem;
}

- (RELongTextItem *)notesItem
{
    if (!_notesItem) {
        _notesItem = [RELongTextItem item];
        _notesItem.cellHeight = 88;
        _notesItem.autocapitalizationType = UITextAutocapitalizationTypeSentences;
    }
    return _notesItem;
}

- (RETableViewItem *)addAuthorButton
{
    if (!_addAuthorButton) {
        _addAuthorButton = [RETableViewItem itemWithTitle:@"Add Author"
                                            accessoryType:UITableViewCellAccessoryNone
                                         selectionHandler:^(RETableViewItem *item) {
                                             [self.authorsSection removeLastItem];
                                             [self addAuthorTextItem:nil toSection:self.authorsSection];
                                             [self.authorsSection addItem:item];
                                             [self.authorsSection reloadSectionWithAnimation:UITableViewRowAnimationFade];
                                         }];
        _addAuthorButton.textAlignment = NSTextAlignmentCenter;
    }
    return _addAuthorButton;
}

- (RETableViewItem *)addTagButton
{
    if (!_addTagButton) {
        _addTagButton = [RETableViewItem itemWithTitle:@"Add Tag"
                                         accessoryType:UITableViewCellAccessoryNone
                                      selectionHandler:^(RETableViewItem *item) {
                                          [self.tagsSection removeLastItem];
                                          [self addTagTextItem:nil toSection:self.tagsSection];
                                          [self.tagsSection addItem:item];
                                          [self.tagsSection reloadSectionWithAnimation:UITableViewRowAnimationFade];
                                      }];
        _addTagButton.textAlignment = NSTextAlignmentCenter;
    }
    return _addTagButton;
}

- (NSMutableArray *)authors
{
    if (!_authors) {
        _authors = [NSMutableArray array];
    }
    return _authors;
}

- (NSMutableArray *)tags
{
    if (!_tags) {
        _tags = [NSMutableArray array];
    }
    return _tags;
}

- (void)configureWithManager:(RETableViewManager *)manager
{
    [manager removeAllSections];
    
    manager[@"RECustomImageItem"] = @"RECustomImageCell";
    
    [manager addSection:self.imageSection];
    [manager addSection:self.defaultSection];
    [manager addSection:self.authorsSection];
    [manager addSection:self.summarySection];
    [manager addSection:self.tagsSection];
    [manager addSection:self.notesSection];
}

#pragma mark - Public

- (void)addAuthorTextItem:(NSString *)value toSection:(RETableViewSection *)section
{
    RETextItem *authorItem = [RETextItem itemWithTitle:nil
                                                 value:value
                                           placeholder:@"Name"];
    authorItem.editingStyle = UITableViewCellEditingStyleDelete;
    authorItem.autocapitalizationType = UITextAutocapitalizationTypeWords;
    authorItem.deletionHandler = ^(RETextItem *item) {
        [self.authors removeObject:item];
    };
    
    [self.authors addObject:authorItem];
    
    [section addItem:authorItem];
}

- (void)addTagTextItem:(NSString *)value toSection:(RETableViewSection *)section
{
    RETextItem *tagItem = [RETextItem itemWithTitle:nil
                                              value:value
                                        placeholder:@"Name"];
    tagItem.editingStyle = UITableViewCellEditingStyleDelete;
    tagItem.deletionHandler = ^(RETextItem *item) {
        [self.tags removeObject:item];
    };
    
    [self.tags addObject:tagItem];
    
    [section addItem:tagItem];
}

@end
