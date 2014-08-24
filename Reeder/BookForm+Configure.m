//
//  BookForm+Configure.m
//  Reeder
//
//  Created by Philip Nichols on 8/23/14.
//  Copyright (c) 2014 Phil Nichols. All rights reserved.
//

#import "BookForm+Configure.h"
#import "Book.h"
#import "RECustomImageItem.h"
#import "Author.h"
#import "ReadingCollectionItemTag.h"

@implementation BookForm (Configure)

- (void)configureWithBook:(Book *)book
{
    self.customImageItem.customImage = [UIImage imageWithContentsOfFile:book.imageFileURL];
    self.titleItem.value = book.title;
    self.publisherItem.value = book.publisher;
    self.publishedDateItem.value = book.publishedDate;
    self.pageCountItem.value = [book.pageCount stringValue];
    self.ratingItem.value = @[[book.rating stringValue]];
    self.summaryItem.value = book.summary;
    self.notesItem.value = book.notes;
    
    [self.authorsSection removeAllItems];
    [self.authors removeAllObjects];
    for (Author *author in book.authors) {
        [self addAuthorTextItem:author.name toSection:self.authorsSection];
    }
    [self.authorsSection addItem:self.addAuthorButton];
    
    [self.tagsSection removeAllItems];
    [self.tags removeAllObjects];
    for (ReadingCollectionItemTag *tag in book.tags) {
        [self addTagTextItem:tag.name toSection:self.tagsSection];
    }
    [self.tagsSection addItem:self.addTagButton];
}

@end
