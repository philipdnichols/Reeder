//
//  RECustomImageCell.m
//  Reeder
//
//  Created by Philip Nichols on 8/22/14.
//  Copyright (c) 2014 Phil Nichols. All rights reserved.
//

#import "RECustomImageCell.h"

@implementation RECustomImageCell

static CGFloat const RECustomImageCellHeight = 300;

+ (CGFloat)heightWithItem:(RETableViewItem *)item tableViewManager:(RETableViewManager *)tableViewManager
{
    return RECustomImageCellHeight;
}

- (void)cellWillAppear
{
    [super cellWillAppear];
//    self.customImageView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    self.customImageView.image = self.item.customImage;
}

@end
