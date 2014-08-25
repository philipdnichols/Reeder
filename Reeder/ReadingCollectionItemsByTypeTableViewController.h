//
//  ReadingCollectionItemByTypeTableViewController.h
//  Reeder
//
//  Created by Philip Nichols on 8/24/14.
//  Copyright (c) 2014 Phil Nichols. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ReadingCollectionItem.h"

typedef CGFloat(^CellHeightBlock)(NSIndexPath *indexPath);

@interface ReadingCollectionItemsByTypeTableViewController : UITableViewController

@property (nonatomic) ReadingCollectionItemType type;

@end
