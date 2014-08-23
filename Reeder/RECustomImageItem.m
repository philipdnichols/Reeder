//
//  RECustomImageItem.m
//  Reeder
//
//  Created by Philip Nichols on 8/22/14.
//  Copyright (c) 2014 Phil Nichols. All rights reserved.
//

#import "RECustomImageItem.h"

@implementation RECustomImageItem

+ (RECustomImageItem *) itemWithCustomImage:(UIImage *)customImage
{
    RECustomImageItem *item = [RECustomImageItem item];
    item.customImage = customImage;
    return item;
}

@end
