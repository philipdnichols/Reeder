//
//  EBookLogCell+Configure.m
//  Reeder
//
//  Created by Philip Nichols on 8/24/14.
//  Copyright (c) 2014 Phil Nichols. All rights reserved.
//

#import "EBookLogCell+Configure.h"
#import "EBookLog.h"
#import "ReadingCollectionItem.h"

@implementation EBookLogCell (Configure)

- (NSDateFormatter *)dateFormatter
{
    static NSDateFormatter *dateFormatter;
    if (!dateFormatter) {
        dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateStyle:NSDateFormatterLongStyle];
        [dateFormatter setTimeStyle:NSDateFormatterLongStyle];
    }
    return dateFormatter;
}

- (void)configureWithEBookLog:(EBookLog *)ebookLog
{
    self.ebookLogImageView.image = [UIImage imageWithContentsOfFile:ebookLog.collectionItem.thumbnailImageFileURL];
    self.titleLabel.text = ebookLog.collectionItem.title;
    self.timeLabel.text = [[self dateFormatter] stringFromDate:ebookLog.startTime];
}

@end
