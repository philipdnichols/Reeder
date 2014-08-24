//
//  EBookForm.m
//  Reeder
//
//  Created by Philip Nichols on 8/22/14.
//  Copyright (c) 2014 Phil Nichols. All rights reserved.
//

#import "EBookForm.h"
#import "EBookForm+Configure.h"

@interface EBookForm ()

@property (strong, nonatomic) RETableViewSection *ebookDefaultSection;

@property (strong, nonatomic, readwrite) RETextItem *publisherItem;

@end

@implementation EBookForm

#pragma mark - Properties

- (RETableViewSection *)defaultSection
{
    return self.ebookDefaultSection;
}

- (RETableViewSection *)ebookDefaultSection
{
    if (!_ebookDefaultSection) {
        _ebookDefaultSection = [RETableViewSection section];
        [_ebookDefaultSection addItem:self.titleItem];
        [_ebookDefaultSection addItem:self.publisherItem];
        [_ebookDefaultSection addItem:self.publishedDateItem];
        [_ebookDefaultSection addItem:self.ratingItem];
    }
    return _ebookDefaultSection;
}

- (RETextItem *)publisherItem
{
    if (!_publisherItem) {
        _publisherItem = [RETextItem itemWithTitle:@"Publisher"];
        _publisherItem.autocapitalizationType = UITextAutocapitalizationTypeWords;
    }
    return _publisherItem;
}

#pragma mark - Initialization

- (instancetype)initWithEBook:(EBook *)ebook
{
    self = [super init];
    if (self && ebook) {
        [self configureWithEBook:ebook];
    }
    return self;
}

@end
