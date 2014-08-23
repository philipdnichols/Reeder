//
//  RECustomImageCell.h
//  Reeder
//
//  Created by Philip Nichols on 8/22/14.
//  Copyright (c) 2014 Phil Nichols. All rights reserved.
//

#import "RETableViewCell.h"
#import "RECustomImageItem.h"

@interface RECustomImageCell : RETableViewCell

@property (strong, nonatomic) RECustomImageItem *item;

@property (weak, nonatomic) IBOutlet UIImageView *customImageView;

@end
