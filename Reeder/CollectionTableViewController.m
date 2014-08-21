//
//  CollectionTableViewController.m
//  Reeder
//
//  Created by Philip Nichols on 8/20/14.
//  Copyright (c) 2014 Phil Nichols. All rights reserved.
//

#import "CollectionTableViewController.h"
#import "ReadingCollectionItem.h"

@interface CollectionTableViewController ()

@property (strong, nonatomic) NSFetchRequest *request;
@property (strong, nonatomic) NSString *groupKeyPath;

@property (nonatomic, copy) FetchedResultsCellConfigureBlock collectionItemCellConfigureBlock;
@property (nonatomic, copy) FetchedResultsCellDeleteBlock collectionItemCellDeleteBlock;

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

- (NSString *)cellIdentifier
{
    // TODO hardcode this
    return @"ReadingCollectionItemCell";
}

- (FetchedResultsCellConfigureBlock)fetchedResultsConfigureBlock
{
    return self.collectionItemCellConfigureBlock;
}

- (FetchedResultsCellDeleteBlock)fetchedResultsDeleteBlock
{
    return self.collectionItemCellDeleteBlock;
}

- (FetchedResultsCellConfigureBlock)collectionItemCellConfigureBlock
{
    if (!_collectionItemCellConfigureBlock) {
        _collectionItemCellConfigureBlock = ^(UITableViewCell *collectionItemCell, ReadingCollectionItem *collectionItem) {
            // TODO: Custom cell and category
            // TODO: Different types of items
            collectionItemCell.textLabel.text = collectionItem.title;
            collectionItemCell.detailTextLabel.text = collectionItem.detail;
            collectionItemCell.imageView.image = [UIImage imageWithContentsOfFile:collectionItem.thumbnailImageFileURL];
        };
    }
    return _collectionItemCellConfigureBlock;
}

- (FetchedResultsCellDeleteBlock)collectionItemCellDeleteBlock
{
    if (!_collectionItemCellDeleteBlock) {
        __weak typeof(self) weakSelf = self;
        _collectionItemCellDeleteBlock = ^(ReadingCollectionItem *collectionItem) {
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
    return _collectionItemCellDeleteBlock;
}

#pragma mark - IBActions

- (IBAction)addButtonTapped {
    ReadingCollectionItem *item = [ReadingCollectionItem MR_createEntity];
    
    item.title = @"Testing";
    item.detail = @"Testing Detail";
    
    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreWithCompletion:nil];
}

@end
