//
//  ReadingCollectionItemByTypeTableViewController.m
//  Reeder
//
//  Created by Philip Nichols on 8/24/14.
//  Copyright (c) 2014 Phil Nichols. All rights reserved.
//

#import "ReadingCollectionItemsByTypeTableViewController.h"
#import "BookCell.h"
#import "EBookCell.h"
#import "ArrayDataSource.h"
#import "Book.h"
#import "EBook.h"
#import "BookCell+Configure.h"
#import "EBookCell+Configure.h"

@interface ReadingCollectionItemsByTypeTableViewController ()

@property (strong, nonatomic) ArrayDataSource *readingCollectionItemsArrayDataSource;

@property (nonatomic, copy) TableViewCellIdentifierBlock readingCollectionItemCellIdentifierBlock;
@property (nonatomic, copy) TableViewCellConfigureBlock readingCollectionItemCellConfigureBlock;
@property (nonatomic, copy) CellHeightBlock readingCollectionItemCellHeightBlock;

@end

@implementation ReadingCollectionItemsByTypeTableViewController

#pragma mark - Properties

- (void)setType:(ReadingCollectionItemType)type
{
    _type = type;
    self.title = [ReadingCollectionItem pluralStringFromType:_type];
    
    if (self.view.window) {
        [self updateUI];
    }
}

- (void)setReadingCollectionItemsArrayDataSource:(ArrayDataSource *)readingCollectionItemsArrayDataSource
{
    _readingCollectionItemsArrayDataSource = readingCollectionItemsArrayDataSource;
    
    self.tableView.dataSource = _readingCollectionItemsArrayDataSource;
    [self.tableView reloadData];
}

// TODO: Some of this code is copied from the main collection table view controller. Worth putting in their own clases?
- (TableViewCellIdentifierBlock)readingCollectionItemCellIdentifierBlock
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

- (TableViewCellConfigureBlock)readingCollectionItemCellConfigureBlock
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

- (CellHeightBlock)readingCollectionItemCellHeightBlock
{
    if (!_readingCollectionItemCellHeightBlock) {
        __weak typeof(self) weakSelf = self;
        _readingCollectionItemCellHeightBlock = ^CGFloat(NSIndexPath *indexPath) {
            ReadingCollectionItem *readingCollectionItem = [weakSelf.readingCollectionItemsArrayDataSource itemAtIndexPath:indexPath];
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

#pragma mark - Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupTableView];
    
    [self updateUI];
}

- (void)setupTableView
{
    [self.tableView registerNib:[BookCell nib] forCellReuseIdentifier:[BookCell identifier]];
    [self.tableView registerNib:[EBookCell nib] forCellReuseIdentifier:[EBookCell identifier]];
}

- (void)updateUI
{
    NSArray *items = nil;
    switch (self.type) {
        case ReadingCollectionItemTypeBook:
            items = [Book MR_findAllSortedBy:@"title"
                                   ascending:YES];
            break;
            
        case ReadingCollectionItemTypeEBook:
            items = [EBook MR_findAllSortedBy:@"title"
                                    ascending:YES];
            break;
    }
    
    self.readingCollectionItemsArrayDataSource = [[ArrayDataSource alloc] initWithItems:items
                                                                    cellIdentifierBlock:self.readingCollectionItemCellIdentifierBlock
                                                                     configureCellBlock:self.readingCollectionItemCellConfigureBlock];
}

#pragma mark - IBActions

- (IBAction)cancelButtonTapped
{
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return self.readingCollectionItemCellHeightBlock(indexPath);
}

@end
