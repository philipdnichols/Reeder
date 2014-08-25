//
//  BookLogCell+Configure.h
//  Reeder
//
//  Created by Philip Nichols on 8/24/14.
//  Copyright (c) 2014 Phil Nichols. All rights reserved.
//

#import "BookLogCell.h"

@class BookLog;

@interface BookLogCell (Configure)

- (void)configureWithBookLog:(BookLog *)bookLog;

@end
