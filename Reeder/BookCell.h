//
//  BookCell.h
//  Reeder
//
//  Created by Philip Nichols on 8/23/14.
//  Copyright (c) 2014 Phil Nichols. All rights reserved.
//

#import "CustomUITableViewCell.h"

@interface BookCell : CustomUITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *bookImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *authorsLabel;
@property (weak, nonatomic) IBOutlet UILabel *publishedDateLabel;
@property (weak, nonatomic) IBOutlet UILabel *pageCountLabel;

@end
