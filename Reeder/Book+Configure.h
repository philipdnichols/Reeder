//
//  Book+Configure.h
//  Reeder
//
//  Created by Philip Nichols on 8/23/14.
//  Copyright (c) 2014 Phil Nichols. All rights reserved.
//

#import "Book.h"

@class BookForm;

@interface Book (Configure)

- (void)configureWithForm:(BookForm *)bookForm success:(void(^)())success failure:(void(^)(NSError *error))failure;

@end
