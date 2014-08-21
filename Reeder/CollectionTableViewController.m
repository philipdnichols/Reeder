//
//  CollectionTableViewController.m
//  Reeder
//
//  Created by Philip Nichols on 8/20/14.
//  Copyright (c) 2014 Phil Nichols. All rights reserved.
//

#import "CollectionTableViewController.h"
#import "ReadingCollectionItem.h"
#import "Book.h"
#import "EBook.h"

@interface CollectionTableViewController ()

@property (strong, nonatomic) NSFetchRequest *request;
@property (strong, nonatomic) NSString *groupKeyPath;

@property (nonatomic, copy) FetchedResultsCellIdentifierBlock readingCollectionItemCellIdentifierBlock;
@property (nonatomic, copy) FetchedResultsCellConfigureBlock readingCollectionItemCellConfigureBlock;
@property (nonatomic, copy) FetchedResultsCellDeleteBlock readingCollectionItemCellDeleteBlock;

@end

@implementation CollectionTableViewController

#pragma mark - Properties

@synthesize request = _request;
@synthesize groupKeyPath = _groupKeyPath;

- (NSFetchRequest *)fetchedRequest
{
    return self.request;
}

- (NSString *)fetchedGroupKeyPath
{
    return self.groupKeyPath;
}

- (NSFetchRequest *)request
{
    if (!_request) {
        _request = [ReadingCollectionItem MR_requestAllSortedBy:@"title"
                                                      ascending:YES];
    }
    return _request;
}

- (NSString *)groupKeyPath
{
//    if (!_groupKeyPath) {
//
//    }
    return _groupKeyPath;
}

- (void)setRequest:(NSFetchRequest *)request
{
    _request = request;
    self.fetchedRequest = _request;
}

- (void)setGroupKeyPath:(NSString *)groupKeyPath
{
    _groupKeyPath = groupKeyPath;
    self.fetchedGroupKeyPath = _groupKeyPath;
}

- (FetchedResultsCellIdentifierBlock)fetchedResultsIdentifierBlock
{
    return self.readingCollectionItemCellIdentifierBlock;
}

- (FetchedResultsCellConfigureBlock)fetchedResultsConfigureBlock
{
    return self.readingCollectionItemCellConfigureBlock;
}

- (FetchedResultsCellDeleteBlock)fetchedResultsDeleteBlock
{
    return self.readingCollectionItemCellDeleteBlock;
}

- (FetchedResultsCellIdentifierBlock)readingCollectionItemCellIdentifierBlock
{
    if (!_readingCollectionItemCellIdentifierBlock) {
        _readingCollectionItemCellIdentifierBlock = ^NSString *(ReadingCollectionItem *readingCollectionItem) {
            // TODO: Get rid of the hardcodes
            if ([readingCollectionItem isKindOfClass:[Book class]]) {
                return @"BookCell";
            } else if ([readingCollectionItem isKindOfClass:[EBook class]]) {
                return @"EBookCell";
            }
            return nil;
        };
    }
    return _readingCollectionItemCellIdentifierBlock;
}

- (FetchedResultsCellConfigureBlock)readingCollectionItemCellConfigureBlock
{
    if (!_readingCollectionItemCellConfigureBlock) {
        _readingCollectionItemCellConfigureBlock = ^(UITableViewCell *collectionItemCell, ReadingCollectionItem *collectionItem) {
            // TODO: Custom cell and category
            // TODO: Different types of items
            collectionItemCell.textLabel.text = collectionItem.title;
            collectionItemCell.detailTextLabel.text = collectionItem.detail;
            collectionItemCell.imageView.image = [UIImage imageWithContentsOfFile:collectionItem.thumbnailImageFileURL];
        };
    }
    return _readingCollectionItemCellConfigureBlock;
}

- (FetchedResultsCellDeleteBlock)readingCollectionItemCellDeleteBlock
{
    if (!_readingCollectionItemCellDeleteBlock) {
        __weak typeof(self) weakSelf = self;
        _readingCollectionItemCellDeleteBlock = ^(ReadingCollectionItem *collectionItem) {
            [collectionItem deleteWithSuccess:^{
                // All is well.
            } failure:^(NSError *error) {
                [TSMessage showNotificationInViewController:weakSelf
                                                      title:@"Error"
                                                   subtitle:[error localizedDescription]
                                                       type:TSMessageNotificationTypeError];
                
                DDLogError(@"There was an error deleting the item: %@", [error localizedDescription]);
            }];
        };
    }
    return _readingCollectionItemCellDeleteBlock;
}

#pragma mark - IBActions

- (IBAction)addButtonTapped {
    Book *book = [Book MR_createEntity];
    
    book.title = @"Book Test";
    book.detail = @"Book Test";
    
    EBook *ebook = [EBook MR_createEntity];
    ebook.title = @"EBook Test";
    ebook.detail = @"EBook Test";
    
    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreWithCompletion:nil];
}

@end
