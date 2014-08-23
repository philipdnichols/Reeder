//
//  BookCell+Configure.m
//  Reeder
//
//  Created by Philip Nichols on 8/23/14.
//  Copyright (c) 2014 Phil Nichols. All rights reserved.
//

#import "BookCell+Configure.h"
#import "Book.h"

@implementation BookCell (Configure)

- (NSDateFormatter *)dateFormatter
{
    static NSDateFormatter *dateFormatter;
    if (!dateFormatter) {
        dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateStyle:NSDateFormatterLongStyle];
        [dateFormatter setTimeStyle:NSDateFormatterNoStyle];
    }
    return dateFormatter;
}

- (void)configureWithBook:(Book *)book
{
    self.bookImageView.image = [UIImage imageWithContentsOfFile:book.thumbnailImageFileURL];
    self.titleLabel.text = book.title;
    self.authorsLabel.text = [book formattedAuthors];
    self.publishedDateLabel.text = [[self dateFormatter] stringFromDate:book.publishedDate];
    self.pageCountLabel.text = [book.pageCount stringValue];
}

@end
