//
//  RECustomImageItem.h
//  Reeder
//
//  Created by Philip Nichols on 8/22/14.
//  Copyright (c) 2014 Phil Nichols. All rights reserved.
//

#import "RETableViewItem.h"

@interface RECustomImageItem : RETableViewItem

@property (strong, nonatomic) UIImage *customImage;

+ (RECustomImageItem *) itemWithCustomImage:(UIImage *)customImage;

@end
