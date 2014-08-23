//
//  NSFetchedResultsTableViewController.h
//  Shylf
//
//  Created by Philip Nichols on 8/13/14.
//  Copyright (c) 2014 Phil Nichols. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NSFetchedResultsControllerDataSource.h"

typedef CGFloat(^FetchedResultsCellHeightBlock)(NSIndexPath *indexPath);

@interface NSFetchedResultsTableViewController : UITableViewController <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) NSFetchRequest *fetchedRequest;
@property (strong, nonatomic) NSString *fetchedGroupKeyPath;

@property (strong, nonatomic, readonly) NSFetchedResultsControllerDataSource *fetchedResultsControllerDataSource;
@property (nonatomic, copy) FetchedResultsCellIdentifierBlock fetchedResultsCellIdentifierBlock;
@property (nonatomic, copy) FetchedResultsCellHeightBlock fetchedResultsCellHeightBlock;
@property (nonatomic, copy) FetchedResultsCellConfigureBlock fetchedResultsCellConfigureBlock;
@property (nonatomic, copy) FetchedResultsCellDeleteBlock fetchedResultsCellDeleteBlock;

@end
