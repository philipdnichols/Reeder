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
#import "ReadingCollectionItemFormViewController.h"
#import "ReadingCollectionItemTypesTableViewController.h"
#import "SIActionSheet+Convenience.h"
#import "BookCell.h"
#import "BookCell+Configure.h"
#import "EBookCell.h"
#import "EBookCell+Configure.h"
#import "ReadingCollectionItemForm.h"
#import "BookForm.h"
#import "EBookForm.h"
#import "Book+Configure.h"
#import "EBook+Configure.h"

@interface ReadingCollectionItemsTableViewController ()

@property (strong, nonatomic) NSFetchRequest *request;
@property (strong, nonatomic) NSString *groupKeyPath;

@property (nonatomic, copy) FetchedResultsCellIdentifierBlock readingCollectionItemCellIdentifierBlock;
@property (nonatomic, copy) FetchedResultsCellHeightBlock readingCollectionItemCellHeightBlock;
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
//        _groupKeyPath = @"";
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

- (FetchedResultsCellIdentifierBlock)fetchedResultsCellIdentifierBlock
{
    return self.readingCollectionItemCellIdentifierBlock;
}

- (FetchedResultsCellHeightBlock)fetchedResultsCellHeightBlock
{
    return self.readingCollectionItemCellHeightBlock;
}

- (FetchedResultsCellConfigureBlock)fetchedResultsCellConfigureBlock
{
    return self.readingCollectionItemCellConfigureBlock;
}

- (FetchedResultsCellDeleteBlock)fetchedResultsCellDeleteBlock
{
    return self.readingCollectionItemCellDeleteBlock;
}

- (FetchedResultsCellIdentifierBlock)readingCollectionItemCellIdentifierBlock
{
    if (!_readingCollectionItemCellIdentifierBlock) {
        _readingCollectionItemCellIdentifierBlock = ^NSString *(ReadingCollectionItem *readingCollectionItem) {
            if ([readingCollectionItem isKindOfClass:[Book class]]) {
                return [BookCell identifier];
            } else if ([readingCollectionItem isKindOfClass:[EBook class]]) {
                return [EBookCell identifier];
            }
            return nil;
        };
    }
    return _readingCollectionItemCellIdentifierBlock;
}

- (FetchedResultsCellHeightBlock)readingCollectionItemCellHeightBlock
{
    if (!_readingCollectionItemCellHeightBlock) {
        __weak typeof(self) weakSelf = self;
        _readingCollectionItemCellHeightBlock = ^CGFloat(NSIndexPath *indexPath) {
            ReadingCollectionItem *readingCollectionItem = [weakSelf.fetchedResultsControllerDataSource itemAtIndexPath:indexPath];
            if ([readingCollectionItem isKindOfClass:[Book class]]) {
                return [BookCell height];
            } else if ([readingCollectionItem isKindOfClass:[EBook class]]) {
                return [EBookCell height];
            } else {
                return 44;
            }
        };
    }
    return _readingCollectionItemCellHeightBlock;
}

- (FetchedResultsCellConfigureBlock)readingCollectionItemCellConfigureBlock
{
    if (!_readingCollectionItemCellConfigureBlock) {
        _readingCollectionItemCellConfigureBlock = ^(UITableViewCell *readingCollectionItemCell, ReadingCollectionItem *readingCollectionItem) {
            if ([readingCollectionItemCell isKindOfClass:[BookCell class]]) {
                BookCell *bookCell = (BookCell *)readingCollectionItemCell;
                [bookCell configureWithBook:(Book *)readingCollectionItem];
            } else if ([readingCollectionItemCell isKindOfClass:[EBookCell class]]) {
                EBookCell *ebookCell = (EBookCell *)readingCollectionItemCell;
                [ebookCell configureWithEBook:(EBook *)readingCollectionItem];
            } else {
                readingCollectionItemCell.textLabel.text = readingCollectionItem.title;
                readingCollectionItemCell.detailTextLabel.text = [readingCollectionItem formattedAuthors];
                readingCollectionItemCell.imageView.image = [UIImage imageWithContentsOfFile:readingCollectionItem.thumbnailImageFileURL];
            }
        };
    }
    return _readingCollectionItemCellConfigureBlock;
}

- (FetchedResultsCellDeleteBlock)readingCollectionItemCellDeleteBlock
{
    if (!_readingCollectionItemCellDeleteBlock) {
        __weak typeof(self) weakSelf = self;
        _readingCollectionItemCellDeleteBlock = ^(ReadingCollectionItem *collectionItem) {
            SIAlertView *alertView = [[SIAlertView alloc] initWithTitle:@"Delete"
                                                             andMessage:@"Are you sure?"];
            [alertView addButtonWithTitle:@"Cancel"
                                     type:SIAlertViewButtonTypeCancel
                                  handler:^(SIAlertView *alertView) {
                                      [weakSelf.tableView setEditing:NO animated:YES];
                                  }];
            
            [alertView addButtonWithTitle:@"Yes"
                                     type:SIAlertViewButtonTypeDestructive
                                  handler:^(SIAlertView *alertView) {
                                      [collectionItem deleteWithSuccess:^{
                                          // All is well.
                                      } failure:^(NSError *error) {
                                          [TSMessage showNotificationInViewController:weakSelf
                                                                                title:@"Error"
                                                                             subtitle:[error localizedDescription]
                                                                                 type:TSMessageNotificationTypeError];
                                      
                                          DDLogError(@"There was an error deleting the reading collection item: %@", [error localizedDescription]);
                                      }];
                                  }];
            
            alertView.transitionStyle = SIAlertViewTransitionStyleFade;
            alertView.buttonsListStyle = SIAlertViewButtonsListStyleNormal;
            alertView.backgroundStyle = SIAlertViewBackgroundStyleSolid;
            
            [alertView show];
        };
    }
    return _readingCollectionItemCellDeleteBlock;
}

#pragma mark - Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupTableView];
}

- (void)setupTableView
{
    [self.tableView registerNib:[BookCell nib] forCellReuseIdentifier:[BookCell identifier]];
    [self.tableView registerNib:[EBookCell nib] forCellReuseIdentifier:[EBookCell identifier]];
}

#pragma mark - IBActions

- (IBAction)addButtonTapped {
    NSMutableDictionary *typesButtonHandlers = [NSMutableDictionary dictionary];
    for (NSNumber *type in [ReadingCollectionItem typesAsTypes]) {
        SIActionSheetHandlerBlock handler = ^(SIActionSheet *actionSheet) {
            SIActionSheetHandlerBlock addHandler = ^(SIActionSheet *actionSheet) {
                [self performSegueWithIdentifier:AddReadingCollectionItemSegueIdentifier sender:type];
            };
            
            SIActionSheetHandlerBlock searchHandler = ^(SIActionSheet *actionSheet) {
                // TODO:
            };
            
            SIActionSheetHandlerBlock scanBarcodeHandler = ^(SIActionSheet *actionSheet) {
                // TODO:
            };
            
            NSDictionary *addActionButtonHandlers = @{
                                                      @"Add" : addHandler,
                                                      @"Search" : searchHandler,
                                                      @"Scan Barcode" : scanBarcodeHandler
                                                      };
            
            [[SIActionSheet actionSheetWithTitle:nil
                                    buttonTitles:@[@"Add", @"Search", @"Scan Barcode"]
                                  buttonHandlers:addActionButtonHandlers
                                   cancelHandler:nil] show];
        };
        
        [typesButtonHandlers setObject:handler forKey:[ReadingCollectionItem stringFromType:(ReadingCollectionItemType)[type unsignedIntegerValue]]];
    }
    
    [[SIActionSheet actionSheetWithTitle:nil
                            buttonTitles:[ReadingCollectionItem typesAsStrings]
                          buttonHandlers:typesButtonHandlers
                           cancelHandler:nil] show];
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    [self performSegueWithIdentifier:ViewReadingCollectionItemSegueIdentifier sender:cell];
}

#pragma mark - Navigation

static NSString * const SelectReadingCollectionItemTypeSegueIdentifier = @"Select Reading Collection Item Type";
static NSString * const AddReadingCollectionItemSegueIdentifier = @"Add Reading Collection Item";
static NSString * const ViewReadingCollectionItemSegueIdentifier = @"View Reading Collection Item";

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
        if ([firstVC isKindOfClass:[ReadingCollectionItemFormViewController class]]) {
            if (![segueIdentifier length] || [segueIdentifier isEqualToString:AddReadingCollectionItemSegueIdentifier]) {
                if ([sender isKindOfClass:[NSNumber class]]) {
                    ReadingCollectionItemType type = (ReadingCollectionItemType)[(NSNumber *)sender unsignedIntegerValue];
                    [self prepareAddReadingCollectionItemFormViewController:(ReadingCollectionItemFormViewController *)firstVC withType:type];
                }
            }
        }
    } else if ([viewController isKindOfClass:[ReadingCollectionItemFormViewController class]]) {
        if (![segueIdentifier length] || [segueIdentifier isEqualToString:ViewReadingCollectionItemSegueIdentifier]) {
            if (indexPath) {
                ReadingCollectionItem *readingCollectionItem = [self.fetchedResultsControllerDataSource itemAtIndexPath:indexPath];
                [self prepareViewReadingCollectionItemFormViewController:(ReadingCollectionItemFormViewController *)viewController
                                               withReadingCollectionItem:readingCollectionItem];
            }
        }
    }
}

- (void)prepareReadingCollectionItemTypesTableViewController:(ReadingCollectionItemTypesTableViewController *)viewController
{
    viewController.readingCollectionItemTypes = [ReadingCollectionItem typesAsTypes];
}

- (void)prepareAddReadingCollectionItemFormViewController:(ReadingCollectionItemFormViewController *)viewController withType:(ReadingCollectionItemType)type
{
    viewController.type = type;
}

- (void)prepareViewReadingCollectionItemFormViewController:(ReadingCollectionItemFormViewController *)viewController
                                 withReadingCollectionItem:(ReadingCollectionItem *)readingCollectionItem
{
    viewController.readingCollectionItem = readingCollectionItem;
}

#pragma mark - Unwinding

- (IBAction)addedReadingCollectionItem:(UIStoryboardSegue *)segue
{
    if ([segue.identifier isEqualToString:ReadingCollectionItemSavedSegueIdentifier]) {
        if ([segue.sourceViewController isKindOfClass:[ReadingCollectionItemFormViewController class]]) {
            [self unwindReadingCollectionItemFormViewController:segue.sourceViewController];
        }
    }
}

- (void)unwindReadingCollectionItemFormViewController:(ReadingCollectionItemFormViewController *)viewController
{
    ReadingCollectionItemForm *readingCollectionItemForm = viewController.readingCollectionItemForm;
    
    ReadingCollectionItem *readingCollectionItem = viewController.readingCollectionItem;
    if (!readingCollectionItem) {
        switch (viewController.type) {
            case ReadingCollectionItemTypeBook:
                readingCollectionItem = [Book MR_createEntity];
                break;
                
            case ReadingCollectionItemTypeEBook:
                readingCollectionItem = [EBook MR_createEntity];
                break;
        }
    }
    
    if ([readingCollectionItemForm isKindOfClass:[BookForm class]]) {
        [(Book *)readingCollectionItem configureWithForm:(BookForm *)readingCollectionItemForm success:^{
            [readingCollectionItem saveWithSuccess:^{
                // All is well.
            } failure:^(NSError *error) {
                [TSMessage showNotificationInViewController:self
                                                      title:@"Error"
                                                   subtitle:[error localizedDescription]
                                                       type:TSMessageNotificationTypeError];
                
                DDLogError(@"There was an error saving a new Book: %@", [error localizedDescription]);
            }];
        } failure:^(NSError *error) {
            [TSMessage showNotificationInViewController:self
                                                  title:@"Error"
                                               subtitle:[error localizedDescription]
                                                   type:TSMessageNotificationTypeError];
            
            DDLogError(@"There was an error adding a new Book: %@", [error localizedDescription]);
        }];
    } else if ([readingCollectionItemForm isKindOfClass:[EBookForm class]]) {
        [(EBook *)readingCollectionItem configureWithForm:(EBookForm *)readingCollectionItemForm success:^{
            [readingCollectionItem saveWithSuccess:^{
                // All is well.
            } failure:^(NSError *error) {
                [TSMessage showNotificationInViewController:self
                                                      title:@"Error"
                                                   subtitle:[error localizedDescription]
                                                       type:TSMessageNotificationTypeError];
                
                DDLogError(@"There was an error saving a new E-Book: %@", [error localizedDescription]);
            }];
        } failure:^(NSError *error) {
            [TSMessage showNotificationInViewController:self
                                                  title:@"Error"
                                               subtitle:[error localizedDescription]
                                                   type:TSMessageNotificationTypeError];
            
            DDLogError(@"There was an error adding a new E-Book: %@", [error localizedDescription]);
        }];
    }
}

@end
