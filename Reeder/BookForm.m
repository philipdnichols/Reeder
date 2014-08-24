//
//  BookForm.m
//  Reeder
//
//  Created by Philip Nichols on 8/22/14.
//  Copyright (c) 2014 Phil Nichols. All rights reserved.
//

#import "BookForm.h"
#import "BookForm+Configure.h"

@interface BookForm ()

@property (strong, nonatomic) RETableViewSection *bookDefaultSection;

@property (strong, nonatomic, readwrite) RETextItem *publisherItem;
@property (strong, nonatomic, readwrite) RENumberItem *pageCountItem;

@end

@implementation BookForm

#pragma mark - Properties

- (RETableViewSection *)defaultSection
{
    return self.bookDefaultSection;
}

- (RETableViewSection *)bookDefaultSection
{
    if (!_bookDefaultSection) {
        _bookDefaultSection = [RETableViewSection section];
        [_bookDefaultSection addItem:self.titleItem];
        [_bookDefaultSection addItem:self.publisherItem];
        [_bookDefaultSection addItem:self.publishedDateItem];
        [_bookDefaultSection addItem:self.pageCountItem];
        [_bookDefaultSection addItem:self.ratingItem];
    }
    return _bookDefaultSection;
}

- (RETextItem *)publisherItem
{
    if (!_publisherItem) {
        _publisherItem = [RETextItem itemWithTitle:@"Publisher"];
        _publisherItem.autocapitalizationType = UITextAutocapitalizationTypeWords;
    }
    return _publisherItem;
}

- (RENumberItem *)pageCountItem
{
    if (!_pageCountItem) {
        _pageCountItem = [RENumberItem itemWithTitle:@"Page Count"];
    }
    return _pageCountItem;
}

#pragma mark - Initialization

- (instancetype)initWithBook:(Book *)book
{
    self = [super init];
    if (self && book) {
        [self configureWithBook:book];
    }
    return self;
}

@end
