//
//  BookLogCell.m
//  Reeder
//
//  Created by Philip Nichols on 8/24/14.
//  Copyright (c) 2014 Phil Nichols. All rights reserved.
//

#import "BookLogCell.h"

@implementation BookLogCell

+ (UINib *)nib
{
    return [UINib nibWithNibName:@"BookLogCell" bundle:nil];
}

+ (NSString *)identifier
{
    return @"BookLogCell";
}

+ (CGFloat)height
{
    return 75;
}

@end
