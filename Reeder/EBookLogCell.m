//
//  EBookLogCell.m
//  Reeder
//
//  Created by Philip Nichols on 8/24/14.
//  Copyright (c) 2014 Phil Nichols. All rights reserved.
//

#import "EBookLogCell.h"

@implementation EBookLogCell

+ (UINib *)nib
{
    return [UINib nibWithNibName:@"EBookLogCell" bundle:nil];
}

+ (NSString *)identifier
{
    return @"EBookLogCell";
}

+ (CGFloat)height
{
    return 65;
}

@end
