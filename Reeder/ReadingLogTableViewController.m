//
//  ReadingLogTableViewController.m
//  Reeder
//
//  Created by Philip Nichols on 8/20/14.
//  Copyright (c) 2014 Phil Nichols. All rights reserved.
//

#import "ReadingLogTableViewController.h"
#import "ReadingLog.h"
#import "BookLog.h"
#import "EBookLog.h"
#import "BookLogCell.h"
#import "EBookLogCell.h"
#import "ReadingCollectionItem.h"
#import "BookLogCell+Configure.h"
#import "EBookLogCell+Configure.h"

@interface ReadingLogTableViewController ()

@property (strong, nonatomic) NSFetchRequest *request;
@property (strong, nonatomic) NSString *groupKeyPath;

@property (nonatomic, copy) FetchedResultsCellIdentifierBlock readingLogCellIdentifierBlock;
@property (nonatomic, copy) FetchedResultsCellHeightBlock readingLogCellHeightBlock;
@property (nonatomic, copy) FetchedResultsCellConfigureBlock readingLogCellConfigureBlock;
@property (nonatomic, copy) FetchedResultsCellDeleteBlock readingLogCellDeleteBlock;

@end

@implementation ReadingLogTableViewController

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
        _request = [ReadingLog MR_requestAllSortedBy:@"startTime"
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
    return self.readingLogCellIdentifierBlock;
}

- (FetchedResultsCellHeightBlock)fetchedResultsCellHeightBlock
{
    return self.readingLogCellHeightBlock;
}

- (FetchedResultsCellConfigureBlock)fetchedResultsCellConfigureBlock
{
    return self.readingLogCellConfigureBlock;
}

- (FetchedResultsCellDeleteBlock)fetchedResultsCellDeleteBlock
{
    return self.readingLogCellDeleteBlock;
}

- (FetchedResultsCellIdentifierBlock)readingLogCellIdentifierBlock
{
    if (!_readingLogCellIdentifierBlock) {
        _readingLogCellIdentifierBlock = ^NSString *(ReadingLog *readingLog) {
            if ([readingLog isKindOfClass:[BookLog class]]) {
                return [BookLogCell identifier];
            } else if ([readingLog isKindOfClass:[EBookLog class]]) {
                return [EBookLogCell identifier];
            }
            return nil;
        };
    }
    return _readingLogCellIdentifierBlock;
}

- (FetchedResultsCellHeightBlock)readingLogCellHeightBlock
{
    if (!_readingLogCellHeightBlock) {
        __weak typeof(self) weakSelf = self;
        _readingLogCellHeightBlock = ^CGFloat(NSIndexPath *indexPath) {
            ReadingLog *readingLog = [weakSelf.fetchedResultsControllerDataSource itemAtIndexPath:indexPath];
            if ([readingLog isKindOfClass:[BookLog class]]) {
                return [BookLogCell height];
            } else if ([readingLog isKindOfClass:[EBookLog class]]) {
                return [EBookLogCell height];
            } else {
                return 44;
            }
        };
    }
    return _readingLogCellHeightBlock;
}

- (FetchedResultsCellConfigureBlock)readingLogCellConfigureBlock
{
    if (!_readingLogCellConfigureBlock) {
        _readingLogCellConfigureBlock = ^(UITableViewCell *readingLogCell, ReadingLog *readingLog) {
            if ([readingLogCell isKindOfClass:[BookLogCell class]]) {
                BookLogCell *bookLogCell = (BookLogCell *)readingLogCell;
                [bookLogCell configureWithBookLog:(BookLog *)readingLog];
            } else if ([readingLogCell isKindOfClass:[EBookLogCell class]]) {
                EBookLogCell *ebookLogCell = (EBookLogCell *)readingLogCell;
                [ebookLogCell configureWithEBookLog:(EBookLog *)readingLog];
            } else {
                readingLogCell.textLabel.text = readingLog.collectionItem.title;
                readingLogCell.imageView.image = [UIImage imageWithContentsOfFile:readingLog.collectionItem.thumbnailImageFileURL];
            }
        };
    }
    return _readingLogCellConfigureBlock;
}

- (FetchedResultsCellDeleteBlock)readingLogCellDeleteBlock
{
    if (!_readingLogCellDeleteBlock) {
        __weak typeof(self) weakSelf = self;
        _readingLogCellDeleteBlock = ^(ReadingLog *readingLog) {
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
                                      [readingLog deleteWithSuccess:^{
                                          // All is well.
                                      } failure:^(NSError *error) {
                                          [TSMessage showNotificationInViewController:weakSelf
                                                                                title:@"Error"
                                                                             subtitle:[error localizedDescription]
                                                                                 type:TSMessageNotificationTypeError];
                                          
                                          DDLogError(@"There was an error deleting the reading log: %@", [error localizedDescription]);
                                      }];
                                  }];
            
            alertView.transitionStyle = SIAlertViewTransitionStyleFade;
            alertView.buttonsListStyle = SIAlertViewButtonsListStyleNormal;
            alertView.backgroundStyle = SIAlertViewBackgroundStyleSolid;
            
            [alertView show];
        };
    }
    return _readingLogCellDeleteBlock;
}

#pragma mark - Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupTableView];
}

- (void)setupTableView
{
    [self.tableView registerNib:[BookLogCell nib] forCellReuseIdentifier:[BookLogCell identifier]];
    [self.tableView registerNib:[EBookLogCell nib] forCellReuseIdentifier:[EBookLogCell identifier]];
}

@end
