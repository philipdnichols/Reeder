//
//  Book+Form.h
//  Reeder
//
//  Created by Philip Nichols on 8/22/14.
//  Copyright (c) 2014 Phil Nichols. All rights reserved.
//

#import "Book.h"

@class BookForm;

@interface Book (Form)

+ (Book *)createWithForm:(BookForm *)form;

@end
