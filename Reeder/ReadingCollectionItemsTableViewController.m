//
//  CollectionTableViewController.m
//  Reeder
//
//  Created by Philip Nichols on 8/20/14.
//  Copyright (c) 2014 Phil Nichols. All rights reserved.
//

#import "ReadingCollectionItemsTableViewController.h"
#import "ReadingCollectionItem.h"
#import "Book.h"
#import "EBook.h"
#import "ReadingCollectionItemTypesTableViewController.h"
#import "AddReadingCollectionItemFormViewController.h"

@interface ReadingCollectionItemsTableViewController ()

@property (strong, nonatomic) NSFetchRequest *request;
@property (strong, nonatomic) NSString *groupKeyPath;

@property (nonatomic, copy) FetchedResultsCellIdentifierBlock readingCollectionItemCellIdentifierBlock;
@property (nonatomic, copy) FetchedResultsCellConfigureBlock readingCollectionItemCellConfigureBlock;
@property (nonatomic, copy) FetchedResultsCellDeleteBlock readingCollectionItemCellDeleteBlock;

@end

@implementation ReadingCollectionItemsTableViewController

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
            SIAlertView *alert = [[SIAlertView alloc] initWithTitle:@"Delete"
                                                         andMessage:@"Are you sure?"];
            [alert addButtonWithTitle:@"Cancel"
                                 type:SIAlertViewButtonTypeCancel
                              handler:^(SIAlertView *alertView) {
                                  [weakSelf.tableView setEditing:NO animated:YES];
                              }];
            
            [alert addButtonWithTitle:@"Yes"
                                 type:SIAlertViewButtonTypeDestructive
                              handler:^(SIAlertView *alertView) {
                                  [collectionItem deleteWithSuccess:^{
                                      // All is well.
                                  } failure:^(NSError *error) {
                                      [TSMessage showNotificationInViewController:weakSelf
                                                                            title:@"Error"
                                                                         subtitle:[error localizedDescription]
                                                                             type:TSMessageNotificationTypeError];
                                      
                                      DDLogError(@"There was an error deleting the item: %@", [error localizedDescription]);
                                  }];
                              }];
            
            alert.transitionStyle = SIAlertViewTransitionStyleFade;
            alert.buttonsListStyle = SIAlertViewButtonsListStyleNormal;
            alert.backgroundStyle = SIAlertViewBackgroundStyleSolid;
            
            [alert show];
        };
    }
    return _readingCollectionItemCellDeleteBlock;
}

#pragma mark - IBActions

- (IBAction)addButtonTapped {
    // TODO: Actionsheet buttons don't have good visual responses
    SIActionSheet *actionSheet = [[SIActionSheet alloc] initWithTitle:nil];
    [actionSheet addButtonWithTitle:@"Add"
                               type:SIActionSheetButtonTypeDefault
                            handler:^(SIActionSheet *actionSheet) {
                                [self performSegueWithIdentifier:SelectReadingCollectionItemTypeSegueIdentifier sender:self];
                            }];
    
    [actionSheet addButtonWithTitle:@"Search"
                               type:SIActionSheetButtonTypeDefault
                            handler:^(SIActionSheet *actionSheet) {
                                // TODO:
                            }];
    
    [actionSheet addButtonWithTitle:@"Scan Barcode"
                               type:SIActionSheetButtonTypeDefault
                            handler:^(SIActionSheet *actionSheet) {
                                // TODO:
                            }];
     
     [actionSheet addButtonWithTitle:@"Cancel"
                                type:SIActionSheetButtonTypeCancel
                             handler:nil];
    
    [actionSheet show];
}

#pragma mark - Navigation

static NSString * const SelectReadingCollectionItemTypeSegueIdentifier = @"Select Reading Collection Item Type";

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    [self prepareViewController:segue.destinationViewController
                       forSegue:segue.identifier
                     fromSender:sender];
}

- (void)prepareViewController:(id)viewController forSegue:(NSString *)segueIdentifier fromSender:(id)sender
{
    NSIndexPath *indexPath = nil;
    if ([sender isKindOfClass:[UITableViewCell class]]) {
        indexPath = [self.tableView indexPathForCell:sender];
    }
    
    if ([viewController isKindOfClass:[UINavigationController class]]) {
        UINavigationController *uiNavigationController = (UINavigationController *)viewController;
        UIViewController *firstVC = [uiNavigationController.viewControllers firstObject];
        if ([firstVC isKindOfClass:[ReadingCollectionItemTypesTableViewController class]]) {
            if (![segueIdentifier length] || [segueIdentifier isEqualToString:SelectReadingCollectionItemTypeSegueIdentifier]) {
                [self prepareReadingCollectionItemTypesTableViewController:(ReadingCollectionItemTypesTableViewController *)firstVC];
            }
        }
    }
}

- (void)prepareReadingCollectionItemTypesTableViewController:(ReadingCollectionItemTypesTableViewController *)viewController
{
    viewController.readingCollectionItemTypes = @[@"Book", @"E-Book"];
}

#pragma mark - Unwinding

- (IBAction)addedReadingCollectionItem:(UIStoryboardSegue *)segue
{
    if ([segue.identifier isEqualToString:ReadingCollectionItemAddedSegueIdentifier]) {
        if ([segue.sourceViewController isKindOfClass:[AddReadingCollectionItemFormViewController class]]) {
            [self unwindAddReadingCollectionItemFormViewController:segue.sourceViewController];
        }
    }
}

- (void)unwindAddReadingCollectionItemFormViewController:(AddReadingCollectionItemFormViewController *)viewController
{
    ReadingCollectionItem *addedReadingCollectionItem = viewController.addedReadingCollectionItem;
    [addedReadingCollectionItem saveWithSuccess:^{
        // All is well.
    } failure:^(NSError *error) {
        [TSMessage showNotificationInViewController:self
                                              title:@"Error"
                                           subtitle:[error localizedDescription]
                                               type:TSMessageNotificationTypeError];
        
        DDLogError(@"There was an error adding a new Reading Collection Item: %@", [error localizedDescription]);
    }];
}

@end
