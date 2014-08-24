//
//  Book+Configure.m
//  Reeder
//
//  Created by Philip Nichols on 8/23/14.
//  Copyright (c) 2014 Phil Nichols. All rights reserved.
//

#import "Book+Configure.h"
#import "BookForm.h"
#import "Author.h"
#import "ReadingCollectionItemTag.h"
#import "UIImage+IO.h"
#import "RECustomImageItem.h"

@implementation Book (Configure)

// TODO: A lot of this should probably be moved to helper methods or categories. Could use some good cleanup.
// TODO: Come back to this to sort out the operationqueue stuff. It might be ok to wrap everything here in a separate operation except the Author and Tag creation, that needs to occurr on
// the same thread that we will be saving on. It might also be prudent to come up with a good strategy for what context/thread/queue should be used for entity creation and saving. Should
// this be on the mian queue?
// TODO: Yeah, seriously this stuff needs to be cleaned up. Queue stuff especially.
- (void)configureWithForm:(BookForm *)bookForm success:(void(^)())success failure:(void(^)(NSError *error))failure
{
    self.title = bookForm.titleItem.value;
    self.publisher = bookForm.publisherItem.value;
    self.publishedDate = bookForm.publishedDateItem.value;
    self.pageCount = @([bookForm.pageCountItem.value integerValue]);
    self.rating = @([(NSString *)[bookForm.ratingItem.value firstObject] integerValue]);
    
    self.summary = bookForm.summaryItem.value;
    
    self.notes = bookForm.notesItem.value;
    
    // Create a set of all Author names that are currently on this Book
    NSMutableSet *authorNamesSet = [NSMutableSet set];
    [self.authors enumerateObjectsUsingBlock:^(Author *author, BOOL *stop) {
        [authorNamesSet addObject:author.name];
    }];
    
    // Make sure all the Authors on the form are added to this Book
    for (RETextItem *authorItem in bookForm.authors) {
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
    
    // Remove all the Authors that are currently on this Book but are not on the form
    [authorNamesSet enumerateObjectsUsingBlock:^(NSString *authorName, BOOL *stop) {
        Author *author = [Author MR_findFirstByAttribute:@"name" withValue:authorName];
        if (author) {
            [self removeAuthorsObject:author];
            
            if (![author.collectionItems count]) {
                [author deleteWithSuccess:nil failure:nil];
            }
        }
    }];
    
    // Create a set of all Tag names that are currently on this Book
    NSMutableSet *tagNamesSet = [NSMutableSet set];
    [self.tags enumerateObjectsUsingBlock:^(ReadingCollectionItemTag *tag, BOOL *stop) {
        [tagNamesSet addObject:tag.name];
    }];
    
    // Make sure all the Tags on the form are added to this Book
    for (RETextItem *tagItem in bookForm.tags) {
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
    
    // Remove all the Tags that are currently on this Book but are not on the form
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
        if (bookForm.changedImage) {
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
            NSURL *imageFileURL = [bookForm.customImageItem.customImage saveToDiskWithName:@"bookImage" error:&error];
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
            NSURL *thumbnailImageFileURL = [bookForm.customImageItem.customImage saveToDiskWithName:@"bookImageThumbnail" error:&error];
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
