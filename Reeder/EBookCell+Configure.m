//
//  EBookCell+Configure.m
//  Reeder
//
//  Created by Philip Nichols on 8/23/14.
//  Copyright (c) 2014 Phil Nichols. All rights reserved.
//

#import "EBookCell+Configure.h"
#import "EBook.h"

@implementation EBookCell (Configure)

- (void)configureWithEBook:(EBook *)ebook
{
    self.ebookImageView.image = [UIImage imageWithContentsOfFile:ebook.thumbnailImageFileURL];
    self.titleLabel.text = ebook.title;
    self.authorsLabel.text = [ebook formattedAuthors];
}

@end
