//
//  EBook+Configure.h
//  Reeder
//
//  Created by Philip Nichols on 8/23/14.
//  Copyright (c) 2014 Phil Nichols. All rights reserved.
//

#import "EBook.h"

@class EBookForm;

@interface EBook (Configure)

- (void)configureWithForm:(EBookForm *)ebookForm success:(void(^)())success failure:(void(^)(NSError *error))failure;

@end
