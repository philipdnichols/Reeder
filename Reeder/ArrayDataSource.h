//
//  ArrayDataSource.h
//  Shylf
//
//  Created by Philip Nichols on 8/14/14.
//  Copyright (c) 2014 Phil Nichols. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NSString *(^TableViewCellIdentifierBlock)(id item);
typedef void (^TableViewCellConfigureBlock)(id cell, id item);
typedef void (^TableViewCellDeleteBlock)(id item);

@interface ArrayDataSource : NSObject <UITableViewDataSource>

- (instancetype)initWithItems:(NSArray *)items
          cellIdentifierBlock:(TableViewCellIdentifierBlock)cellIdentifierBlock
           configureCellBlock:(TableViewCellConfigureBlock)configureCellBlock;

- (instancetype)initWithItems:(NSArray *)items
          cellIdentifierBlock:(TableViewCellIdentifierBlock)cellIdentifierBlock
           configureCellBlock:(TableViewCellConfigureBlock)configureCellBlock
              deleteCellBlock:(TableViewCellDeleteBlock)deleteCellBlock;

- (id)itemAtIndexPath:(NSIndexPath *)indexPath;

@end
