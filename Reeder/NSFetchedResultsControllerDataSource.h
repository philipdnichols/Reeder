//
//  NSFetchedResultsControllerDataSource.h
//  Shylf
//
//  Created by Philip Nichols on 8/15/14.
//  Copyright (c) 2014 Phil Nichols. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NSString *(^FetchedResultsCellIdentifierBlock)(id item);
typedef void (^FetchedResultsCellConfigureBlock)(id cell, id item);
typedef void (^FetchedResultsCellDeleteBlock)(id item);

@interface NSFetchedResultsControllerDataSource : NSObject <UITableViewDataSource>

- (instancetype)initWithFetchedResultsController:(NSFetchedResultsController *)fetchedResultsController
                                  cellIdentifierBlock:(FetchedResultsCellIdentifierBlock)cellIdentifierBlock
                              configureCellBlock:(FetchedResultsCellConfigureBlock)configureCellBlock;

- (instancetype)initWithFetchedResultsController:(NSFetchedResultsController *)fetchedResultsController
                                  cellIdentifierBlock:(FetchedResultsCellIdentifierBlock)cellIdentifierBlock
                              configureCellBlock:(FetchedResultsCellConfigureBlock)configureCellBlock
                                 deleteCellBlock:(FetchedResultsCellDeleteBlock)deleteCellBlock;

- (id)itemAtIndexPath:(NSIndexPath *)indexPath;

@end
