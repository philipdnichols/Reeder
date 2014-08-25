//
//  EBookLogCell.h
//  Reeder
//
//  Created by Philip Nichols on 8/24/14.
//  Copyright (c) 2014 Phil Nichols. All rights reserved.
//

#import "CustomUITableViewCell.h"

@interface EBookLogCell : CustomUITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *ebookLogImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@end
