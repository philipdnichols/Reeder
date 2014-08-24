//
//  EBookForm+Configure.m
//  Reeder
//
//  Created by Philip Nichols on 8/23/14.
//  Copyright (c) 2014 Phil Nichols. All rights reserved.
//

#import "EBookForm+Configure.h"
#import "RECustomImageItem.h"
#import "Author.h"
#import "ReadingCollectionItemTag.h"
#import "EBook.h"

@implementation EBookForm (Configure)

- (void)configureWithEBook:(EBook *)ebook
{
    self.customImageItem.customImage = [UIImage imageWithContentsOfFile:ebook.imageFileURL];
    self.titleItem.value = ebook.title;
    self.publisherItem.value = ebook.publisher;
    self.publishedDateItem.value = ebook.publishedDate;
    self.ratingItem.value = @[[ebook.rating stringValue]];
    self.summaryItem.value = ebook.summary;
    self.notesItem.value = ebook.notes;
    
    [self.authorsSection removeAllItems];
    [self.authors removeAllObjects];
    for (Author *author in ebook.authors) {
        [self addAuthorTextItem:author.name toSection:self.authorsSection];
    }
    [self.authorsSection addItem:self.addAuthorButton];
    
    [self.tagsSection removeAllItems];
    [self.tags removeAllObjects];
    for (ReadingCollectionItemTag *tag in ebook.tags) {
        [self addTagTextItem:tag.name toSection:self.tagsSection];
    }
    [self.tagsSection addItem:self.addTagButton];
}

@end
