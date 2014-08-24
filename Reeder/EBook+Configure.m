//
//  EBook+Configure.m
//  Reeder
//
//  Created by Philip Nichols on 8/23/14.
//  Copyright (c) 2014 Phil Nichols. All rights reserved.
//

#import "EBook+Configure.h"
#import "EBookForm.h"
#import "Author.h"
#import "ReadingCollectionItemTag.h"
#import "RECustomImageItem.h"
#import "UIImage+IO.h"

@implementation EBook (Configure)

- (void)configureWithForm:(EBookForm *)ebookForm success:(void(^)())success failure:(void(^)(NSError *error))failure
{
    self.title = ebookForm.titleItem.value;
    self.publisher = ebookForm.publisherItem.value;
    self.publishedDate = ebookForm.publishedDateItem.value;
    self.rating = @([(NSString *)[ebookForm.ratingItem.value firstObject] integerValue]);
    
    self.summary = ebookForm.summaryItem.value;
    
    self.notes = ebookForm.notesItem.value;
    
    // Create a set of all Author names that are currently on this EBook
    NSMutableSet *authorNamesSet = [NSMutableSet set];
    [self.authors enumerateObjectsUsingBlock:^(Author *author, BOOL *stop) {
        [authorNamesSet addObject:author.name];
    }];
    
    // Make sure all the Authors on the form are added to this EBook
    for (RETextItem *authorItem in ebookForm.authors) {
        Author *author = [Author MR_findFirstByAttribute:@"name" withValue:authorItem.value];
        if (!author) {
            author = [Author MR_createEntity];
            author.name = authorItem.value;
        }
        if ([authorNamesSet containsObject:author.name]) {
            [authorNamesSet removeObject:author.name];
        }
        [self addAuthorsObject:author];
    }
    
    // Remove all the Authors that are currently on this EBook but are not on the form
    [authorNamesSet enumerateObjectsUsingBlock:^(NSString *authorName, BOOL *stop) {
        Author *author = [Author MR_findFirstByAttribute:@"name" withValue:authorName];
        if (author) {
            [self removeAuthorsObject:author];
            
            if (![author.collectionItems count]) {
                [author deleteWithSuccess:nil failure:nil];
            }
        }
    }];
    
    // Create a set of all Tag names that are currently on this EBook
    NSMutableSet *tagNamesSet = [NSMutableSet set];
    [self.tags enumerateObjectsUsingBlock:^(ReadingCollectionItemTag *tag, BOOL *stop) {
        [tagNamesSet addObject:tag.name];
    }];
    
    // Make sure all the Tags on the form are added to this EBook
    for (RETextItem *tagItem in ebookForm.tags) {
        ReadingCollectionItemTag *tag = [ReadingCollectionItemTag MR_findFirstByAttribute:@"name" withValue:[tagItem.value lowercaseString]];
        if (!tag) {
            tag = [ReadingCollectionItemTag MR_createEntity];
            tag.name = [tagItem.value lowercaseString];
        }
        if ([tagNamesSet containsObject:tag.name]) {
            [tagNamesSet removeObject:tag.name];
        }
        [self addTagsObject:tag];
    }
    
    // Remove all the Tags that are currently on this EBook but are not on the form
    [tagNamesSet enumerateObjectsUsingBlock:^(NSString *tagName, BOOL *stop) {
        ReadingCollectionItemTag *tag = [ReadingCollectionItemTag MR_findFirstByAttribute:@"name" withValue:tagName];
        if (tag) {
            [self removeTagsObject:tag];
            
            if (![tag.collectionItems count]) {
                [tag deleteWithSuccess:nil failure:nil];
            }
        }
    }];
    
    if (!self.dateAddedToCollection) {
        self.dateAddedToCollection = [NSDate date];
    }
    
    NSOperationQueue *backgroundQueue = [[NSOperationQueue alloc] init];
    [backgroundQueue addOperationWithBlock:^{
        if (ebookForm.changedImage) {
            NSError *error = nil;
            if (self.imageFileURL) {
                [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                    self.imageFileURL = nil;
                }];
                
                [UIImage deleteFromDiskWithFilePathURL:[NSURL fileURLWithPath:self.imageFileURL] error:&error];
                [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                    if (error) {
                        if (failure) {
                            failure(error);
                        }
                    }
                }];
            }
            
            error = nil;
            if (self.thumbnailImageFileURL) {
                [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                    self.thumbnailImageFileURL = nil;
                }];
                
                [UIImage deleteFromDiskWithFilePathURL:[NSURL fileURLWithPath:self.thumbnailImageFileURL] error:&error];
                [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                    if (error) {
                        if (failure) {
                            failure(error);
                        }
                    }
                }];
            }
            
            error = nil;
            NSURL *imageFileURL = [ebookForm.customImageItem.customImage saveToDiskWithName:@"ebookImage" error:&error];
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                if (!error) {
                    self.imageFileURL = [imageFileURL path];
                } else {
                    if (failure) {
                        failure(error);
                    }
                }
            }];
            
            error = nil;
            NSURL *thumbnailImageFileURL = [ebookForm.customImageItem.customImage saveToDiskWithName:@"ebookImageThumbnail" error:&error];
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                if (!error) {
                    self.thumbnailImageFileURL = [thumbnailImageFileURL path]; // TODO: this should be improved eventually by scaling the image down
                } else {
                    if (failure) {
                        failure(error);
                    }
                }
            }];
        }
        
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            if (success) {
                success();
            }
        }];
    }];
}

@end
