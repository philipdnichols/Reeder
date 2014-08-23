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
    
    [form.customImageItem.customImage saveToDiskAsyncWithName:@"ebookImage"
                                                      success:^(NSURL *url) {
                                                          ebook.imageFileURL = [url path];
                                                          [ebook saveWithSuccess:nil failure:nil];
                                                      }
                                                      failure:^(NSError *error) {
                                                          DDLogError(@"There was an error saving the EBook Image: %@", [error localizedDescription]);
                                                      }];
    
    [form.customImageItem.customImage saveToDiskAsyncWithName:@"ebookImageThumbnail"
                                                      success:^(NSURL *url) {
                                                          ebook.thumbnailImageFileURL = [url path]; // TODO: this should be improved eventually by scaling the image down
                                                          [ebook saveWithSuccess:nil failure:nil];
                                                      }
                                                      failure:^(NSError *error) {
                                                          DDLogError(@"There was an error saving the EBook Image Thumbnail: %@", [error localizedDescription]);
                                                      }];
    
    return ebook;
}

@end
