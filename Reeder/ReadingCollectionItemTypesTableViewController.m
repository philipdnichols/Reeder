//
//  CollectionTypeTableViewController.m
//  Reeder
//
//  Created by Philip Nichols on 8/20/14.
//  Copyright (c) 2014 Phil Nichols. All rights reserved.
//

#import "ReadingCollectionItemTypesTableViewController.h"
#import "ArrayDataSource.h"
#import "ReadingCollectionItemFormViewController.h"

static NSString * const ReadingCollectionItemTypeCellIdentifier = @"ReadingCollectionItemTypeCell";

@interface ReadingCollectionItemTypesTableViewController ()

@property (strong, nonatomic) ArrayDataSource *readingCollectionItemTypeArrayDataSource;

@property (nonatomic, copy) TableViewCellIdentifierBlock readingCollectionItemTypeCellIdentifierBlock;
@property (nonatomic, copy) TableViewCellConfigureBlock readingCollectionItemTypeCellConfigureBlock;

@end

@implementation ReadingCollectionItemTypesTableViewController

#pragma mark - Properties

- (void)setReadingCollectionItemTypes:(NSArray *)readingCollectionItemTypes
{
    _readingCollectionItemTypes = readingCollectionItemTypes;
    
    if (self.view.window) {
        [self updateUI];
    }
}

- (void)setReadingCollectionItemTypeArrayDataSource:(ArrayDataSource *)readingCollectionItemTypeArrayDataSource
{
    _readingCollectionItemTypeArrayDataSource = readingCollectionItemTypeArrayDataSource;
    
    self.tableView.dataSource = _readingCollectionItemTypeArrayDataSource;
    [self.tableView reloadData];
}

- (TableViewCellIdentifierBlock)readingCollectionItemTypeCellIdentifierBlock
{
    if (!_readingCollectionItemTypeCellIdentifierBlock) {
        _readingCollectionItemTypeCellIdentifierBlock = ^NSString *(NSNumber *type) {
            return @"";
        };
    }
    return _readingCollectionItemTypeCellIdentifierBlock;
}

- (TableViewCellConfigureBlock)readingCollectionItemTypeCellConfigureBlock
{
    if (!_readingCollectionItemTypeCellConfigureBlock) {
        _readingCollectionItemTypeCellConfigureBlock = ^(UITableViewCell *cell, NSNumber *type) {
            cell.textLabel.text = [ReadingCollectionItem stringFromType:(ReadingCollectionItemType)[type unsignedIntegerValue]];
        };
    }
    return _readingCollectionItemTypeCellConfigureBlock;
}

#pragma mark - Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self updateUI];
}

- (void)updateUI
{
    self.readingCollectionItemTypeArrayDataSource = [[ArrayDataSource alloc] initWithItems:self.readingCollectionItemTypes
                                                                            cellIdentifierBlock:self.readingCollectionItemTypeCellIdentifierBlock
                                                                        configureCellBlock:self.readingCollectionItemTypeCellConfigureBlock];
}

#pragma mark - IBActions

- (IBAction)cancelButtonTapped
{
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Navigation

static NSString * const AddReadingCollectionItemSegueIdentifier = @"Add Reading Collection Item";

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
    
    if ([viewController isKindOfClass:[ReadingCollectionItemFormViewController class]]) {
        if (![segueIdentifier length] || [segueIdentifier isEqualToString:AddReadingCollectionItemSegueIdentifier]) {
            NSNumber *type = [self.readingCollectionItemTypeArrayDataSource itemAtIndexPath:indexPath];
            
            [self prepareAddReadingCollectionItemFormViewController:viewController withType:(ReadingCollectionItemType)[type unsignedIntegerValue]];
        }
    }
}

- (void)prepareAddReadingCollectionItemFormViewController:(ReadingCollectionItemFormViewController *)viewController withType:(ReadingCollectionItemType)type
{
    viewController.type = type;
}

@end
