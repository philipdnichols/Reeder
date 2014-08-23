//
//  EBookCell.m
//  Reeder
//
//  Created by Philip Nichols on 8/23/14.
//  Copyright (c) 2014 Phil Nichols. All rights reserved.
//

#import "EBookCell.h"

@implementation EBookCell

+ (UINib *)nib
{
    return [UINib nibWithNibName:@"EBookCell" bundle:nil];
}

+ (NSString *)identifier
{
    return @"EBookCell";
}

+ (CGFloat)height
{
    return 50;
}

@end
