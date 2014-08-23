//
//  CustomUITableViewCell.m
//  Shylf
//
//  Created by Philip Nichols on 8/14/14.
//  Copyright (c) 2014 Phil Nichols. All rights reserved.
//

#import "CustomUITableViewCell.h"

@implementation CustomUITableViewCell

+ (UINib *)nib
{
    NSAssert(NO, @"Subclasses of CustomUITableViewCell must implement 'nib'");
    return nil;
}

+ (NSString *)identifier
{
    NSAssert(NO, @"Subclasses of CustomUITableViewCell must implement 'identifier'");
    return nil;
}

+ (CGFloat)height
{
    NSAssert(NO, @"Subclasses of CustomUITableViewCell must implement 'height'");
    return 0;
}

@end
