//
//  BookLogCell+Configure.m
//  Reeder
//
//  Created by Philip Nichols on 8/24/14.
//  Copyright (c) 2014 Phil Nichols. All rights reserved.
//

#import "BookLogCell+Configure.h"
#import "BookLog.h"
#import "ReadingCollectionItem.h"

@implementation BookLogCell (Configure)

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

- (void)configureWithBookLog:(BookLog *)bookLog
{
    self.bookLogImageView.image = [UIImage imageWithContentsOfFile:bookLog.collectionItem.thumbnailImageFileURL];
    self.titleLabel.text = bookLog.collectionItem.title;
    self.timeLabel.text = [[self dateFormatter] stringFromDate:bookLog.startTime];
}

@end
