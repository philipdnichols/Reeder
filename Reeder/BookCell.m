//
//  BookCell.m
//  Reeder
//
//  Created by Philip Nichols on 8/23/14.
//  Copyright (c) 2014 Phil Nichols. All rights reserved.
//

#import "BookCell.h"

@implementation BookCell

+ (UINib *)nib
{
    return [UINib nibWithNibName:@"BookCell" bundle:nil];
}

+ (NSString *)identifier
{
    return @"BookCell";
}

+ (CGFloat)height
{
    return 88;
}

@end
