//
//  AddReadingCollectionItemFormViewController.h
//  Reeder
//
//  Created by Philip Nichols on 8/20/14.
//  Copyright (c) 2014 Phil Nichols. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ReadingCollectionItem.h"

@class ReadingCollectionItemForm;

static NSString * const ReadingCollectionItemSavedSegueIdentifier = @"Reading Collection Item Saved";

@interface ReadingCollectionItemFormViewController : UITableViewController

// In ('type' if creating a new ReadingCollectionItem, 'readingCollectionItem' if viewing/modifying an existing ReadingCollectionItem
@property (nonatomic) ReadingCollectionItemType type;
@property (strong, nonatomic) ReadingCollectionItem *readingCollectionItem;

// Out
@property (strong, nonatomic, readonly) ReadingCollectionItemForm *readingCollectionItemForm;

@end
