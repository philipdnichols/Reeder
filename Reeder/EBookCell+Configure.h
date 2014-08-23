//
//  EBookCell+Configure.h
//  Reeder
//
//  Created by Philip Nichols on 8/23/14.
//  Copyright (c) 2014 Phil Nichols. All rights reserved.
//

#import "EBookCell.h"

@class EBook;

@interface EBookCell (Configure)

- (void)configureWithEBook:(EBook *)ebook;

@end
