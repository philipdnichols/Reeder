//
//  EBook+Form.h
//  Reeder
//
//  Created by Philip Nichols on 8/22/14.
//  Copyright (c) 2014 Phil Nichols. All rights reserved.
//

#import "EBook.h"

@class EBookForm;

@interface EBook (Form)

+ (EBook *)createWithForm:(EBookForm *)form;

@end