//
//  ArrayDataSource.m
//  Shylf
//
//  Created by Philip Nichols on 8/14/14.
//  Copyright (c) 2014 Phil Nichols. All rights reserved.
//

#import "ArrayDataSource.h"

@interface ArrayDataSource ()

@property (strong, nonatomic) NSArray *items;
@property (nonatomic, copy) TableViewCellIdentifierBlock cellIdentifierBlock;
@property (nonatomic, copy) TableViewCellConfigureBlock configureCellBlock;
@property (nonatomic, copy) TableViewCellDeleteBlock deleteCellBlock;

@property (nonatomic) BOOL allowsDeletion;

@end

@implementation ArrayDataSource

#pragma mark - Initializers

- (id)init
{
    NSAssert(NO, @"'init' is not allowed for the ArrayDataSource. Please use another initializer, such as 'initWithItems:cellIdentifierBlock:configureCellBlock' or 'initWithItems:cellIdentifierBlock:configureCellBlock:deleteCellBlock'");
    return nil;
}

- (instancetype)initWithItems:(NSArray *)items
               cellIdentifierBlock:(TableViewCellIdentifierBlock)cellIdentifierBlock
           configureCellBlock:(TableViewCellConfigureBlock)configureCellBlock
{
    self = [super init];
    if (self) {
        self.items = items;
        self.cellIdentifierBlock = [cellIdentifierBlock copy];
        self.configureCellBlock = [configureCellBlock copy];
        self.allowsDeletion = NO;
        self.deleteCellBlock = nil;
    }
    return self;
}

- (instancetype)initWithItems:(NSArray *)items
          cellIdentifierBlock:(TableViewCellIdentifierBlock)cellIdentifierBlock
           configureCellBlock:(TableViewCellConfigureBlock)configureCellBlock
              deleteCellBlock:(TableViewCellDeleteBlock)deleteCellBlock
{
    self = [self initWithItems:items
           cellIdentifierBlock:cellIdentifierBlock
            configureCellBlock:configureCellBlock];
    if (self) {
        self.allowsDeletion = YES;
        self.deleteCellBlock = [deleteCellBlock copy];
    }
    return self;
}

#pragma mark - Public

- (id)itemAtIndexPath:(NSIndexPath *)indexPath
{
    return self.items[(NSUInteger) indexPath.row];
}

#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    id item = [self itemAtIndexPath:indexPath];
    NSString *cellIdentifier = self.cellIdentifierBlock(item);
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier
                                                            forIndexPath:indexPath];
    
    self.configureCellBlock(cell, item);
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.allowsDeletion) {
        return YES;
    }
    
    return NO;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        if (self.allowsDeletion) {
            id item = [self itemAtIndexPath:indexPath];
            self.deleteCellBlock(item);
        }
    }
}

@end
