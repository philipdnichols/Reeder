//
//  ReadingCollectionItemForm.h
//  Reeder
//
//  Created by Philip Nichols on 8/22/14.
//  Copyright (c) 2014 Phil Nichols. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RECustomImageItem;

@interface ReadingCollectionItemForm : NSObject

@property (strong, nonatomic, readonly) RETableViewSection *imageSection;
@property (strong, nonatomic, readonly) RETableViewSection *defaultSection;
@property (strong, nonatomic, readonly) RETableViewSection *authorsSection;
@property (strong, nonatomic, readonly) RETableViewSection *summarySection;
@property (strong, nonatomic, readonly) RETableViewSection *tagsSection;
@property (strong, nonatomic, readonly) RETableViewSection *notesSection;

@property (strong, nonatomic, readonly) RECustomImageItem *customImageItem;
@property (strong, nonatomic, readonly) RETextItem *titleItem;
@property (strong, nonatomic, readonly) REDateTimeItem *publishedDateItem;
@property (strong, nonatomic, readonly) REPickerItem *ratingItem;
@property (strong, nonatomic, readonly) RELongTextItem *summaryItem;
@property (strong, nonatomic, readonly) RELongTextItem *notesItem;
@property (strong, nonatomic, readonly) RETableViewItem *addAuthorButton;
@property (strong, nonatomic, readonly) RETableViewItem *addTagButton;

@property (strong, nonatomic, readonly) NSMutableArray *authors; // of RETextItem
@property (strong, nonatomic, readonly) NSMutableArray *tags; // of RETextItem

@property (nonatomic) BOOL changedImage;

- (void)configureWithManager:(RETableViewManager *)manager;

- (void)addAuthorTextItem:(NSString *)value toSection:(RETableViewSection *)section;
- (void)addTagTextItem:(NSString *)value toSection:(RETableViewSection *)section;

@end
