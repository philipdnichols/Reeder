//
//  Book+Form.m
//  Reeder
//
//  Created by Philip Nichols on 8/22/14.
//  Copyright (c) 2014 Phil Nichols. All rights reserved.
//

#import "Book+Form.h"
#import "Author.h"
#import "ReadingCollectionItemTag.h"
#import "RECustomImageItem.h"
#import "UIImage+IO.h"
#import "BookForm.h"

@implementation Book (Form)

+ (Book *)createWithForm:(BookForm *)form
{
    Book *book = [Book MR_createEntity];
    book.title = form.titleItem.value;
    book.publisher = form.publisherItem.value;
    book.publishedDate = form.publishedDateItem.value;
    book.pageCount = @([form.pageCountItem.value integerValue]);
    book.rating = @([(NSString *)[form.ratingItem.value firstObject] integerValue]);
    
    book.summary = form.summaryItem.value;
    
    book.notes = form.notesItem.value;
    
    for (RETextItem *authorItem in form.authors) {
        Author *author = [[Author MR_findByAttribute:@"name" withValue:authorItem.value] firstObject];
        if (!author) {
            author = [Author MR_createEntity];
            author.name = authorItem.value;
        }
        [book addAuthorsObject:author];
    }
    
    for (RETextItem *tagItem in form.tags) {
        ReadingCollectionItemTag *tag = [[ReadingCollectionItemTag MR_findByAttribute:@"name" withValue:[tagItem.value lowercaseString]] firstObject];
        if (!tag) {
            tag = [ReadingCollectionItemTag MR_createEntity];
            tag.name = [tagItem.value lowercaseString];
        }
        [book addTagsObject:tag];
    }
    
    book.dateAddedToCollection = [NSDate date];
    
    NSURL *imageFileURL = [form.customImageItem.customImage saveToDiskWithName:@"bookImage"];
    if (imageFileURL) {
        book.imageFileURL = [imageFileURL path];
    }
    
    NSURL *thumbnailImageFileURL = [form.customImageItem.customImage saveToDiskWithName:@"bookImageThumbnail"];
    if (thumbnailImageFileURL) {
        book.thumbnailImageFileURL = [thumbnailImageFileURL path]; // TODO: this should be improved eventually by scaling the image down
    }
    
    return book;
}

@end
