//
//  AddReadingCollectionItemFormViewController.h
//  Reeder
//
//  Created by Philip Nichols on 8/20/14.
//  Copyright (c) 2014 Phil Nichols. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ReadingCollectionItem.h"

@class ReadingCollectionItem;

static NSString * const ReadingCollectionItemAddedSegueIdentifier = @"Reading Collection Item Added";

@interface AddReadingCollectionItemFormViewController : UITableViewController

// In
@property (nonatomic) ReadingCollectionItemType type;

// Out
@property (strong, nonatomic, readonly) ReadingCollectionItem *addedReadingCollectionItem;

@end
