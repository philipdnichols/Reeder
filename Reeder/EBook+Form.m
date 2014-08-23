//
//  EBook+Form.m
//  Reeder
//
//  Created by Philip Nichols on 8/22/14.
//  Copyright (c) 2014 Phil Nichols. All rights reserved.
//

#import "EBook+Form.h"
#import "EBookForm.h"
#import "Author.h"
#import "ReadingCollectionItemTag.h"
#import "RECustomImageItem.h"
#import "UIImage+IO.h"

@implementation EBook (Form)

+ (EBook *)createWithForm:(EBookForm *)form
{
    EBook *ebook = [EBook MR_createEntity];
    ebook.title = form.titleItem.value;
    ebook.publisher = form.publisherItem.value;
    ebook.publishedDate = form.publishedDateItem.value;
    ebook.rating = @([(NSString *)[form.ratingItem.value firstObject] integerValue]);
    
    ebook.summary = form.summaryItem.value;
    
    ebook.notes = form.notesItem.value;
    
    for (RETextItem *authorItem in form.authors) {
        Author *author = [[Author MR_findByAttribute:@"name" withValue:authorItem.value] firstObject];
        if (!author) {
            author = [Author MR_createEntity];
            author.name = authorItem.value;
        }
        [ebook addAuthorsObject:author];
    }
    
    for (RETextItem *tagItem in form.tags) {
        ReadingCollectionItemTag *tag = [[ReadingCollectionItemTag MR_findByAttribute:@"name" withValue:[tagItem.value lowercaseString]] firstObject];
        if (!tag) {
            tag = [ReadingCollectionItemTag MR_createEntity];
            tag.name = [tagItem.value lowercaseString];
        }
        [ebook addTagsObject:tag];
    }
    
    ebook.dateAddedToCollection = [NSDate date];
    
    NSURL *imageFileURL = [form.customImageItem.customImage saveToDiskWithName:@"bookImage"];
    if (imageFileURL) {
        ebook.imageFileURL = [imageFileURL path];
    }
    
    NSURL *thumbnailImageFileURL = [form.customImageItem.customImage saveToDiskWithName:@"bookImageThumbnail"];
    if (thumbnailImageFileURL) {
        ebook.thumbnailImageFileURL = [thumbnailImageFileURL path]; // TODO: this should be improved eventually by scaling the image down
    }
    
    return ebook;
}

@end
