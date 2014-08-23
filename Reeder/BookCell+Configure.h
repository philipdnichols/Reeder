//
//  BookCell+Configure.h
//  Reeder
//
//  Created by Philip Nichols on 8/23/14.
//  Copyright (c) 2014 Phil Nichols. All rights reserved.
//

#import "BookCell.h"

@class Book;

@interface BookCell (Configure)

- (void)configureWithBook:(Book *)book;

@end
