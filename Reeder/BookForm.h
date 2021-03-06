//
//  BookForm.h
//  Reeder
//
//  Created by Philip Nichols on 8/22/14.
//  Copyright (c) 2014 Phil Nichols. All rights reserved.
//

#import "ReadingCollectionItemForm.h"

@class Book;

@interface BookForm : ReadingCollectionItemForm

@property (strong, nonatomic, readonly) RETextItem *publisherItem;
@property (strong, nonatomic, readonly) RENumberItem *pageCountItem;

- (instancetype)initWithBook:(Book *)book;

@end
