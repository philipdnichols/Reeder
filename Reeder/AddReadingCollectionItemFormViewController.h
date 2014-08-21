//
//  AddReadingCollectionItemFormViewController.h
//  Reeder
//
//  Created by Philip Nichols on 8/20/14.
//  Copyright (c) 2014 Phil Nichols. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ReadingCollectionItem;

static NSString * const ReadingCollectionItemAddedSegueIdentifier = @"Reading Collection Item Added";

@interface AddReadingCollectionItemFormViewController : UITableViewController <FXFormControllerDelegate>

// In
@property (strong, nonatomic) NSString *type;

// Out
@property (strong, nonatomic, readonly) ReadingCollectionItem *addedReadingCollectionItem;

@end
