//
//  EBookForm.h
//  Reeder
//
//  Created by Philip Nichols on 8/22/14.
//  Copyright (c) 2014 Phil Nichols. All rights reserved.
//

#import "ReadingCollectionItemForm.h"

@class EBook;

@interface EBookForm : ReadingCollectionItemForm

@property (strong, nonatomic, readonly) RETextItem *publisherItem;

- (instancetype)initWithEBook:(EBook *)ebook;

@end
