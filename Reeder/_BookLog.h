// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to BookLog.h instead.

#import <CoreData/CoreData.h>
#import "ReadingLog.h"

extern const struct BookLogAttributes {
	__unsafe_unretained NSString *endPage;
	__unsafe_unretained NSString *startPage;
} BookLogAttributes;

extern const struct BookLogRelationships {
	__unsafe_unretained NSString *chapters;
	__unsafe_unretained NSString *partialChapters;
} BookLogRelationships;

extern const struct BookLogFetchedProperties {
} BookLogFetchedProperties;

@class BookChapter;
@class BookChapter;




@interface BookLogID : NSManagedObjectID {}
@end

@interface _BookLog : ReadingLog {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (BookLogID*)objectID;





@property (nonatomic, strong) NSNumber* endPage;



@property int16_t endPageValue;
- (int16_t)endPageValue;
- (void)setEndPageValue:(int16_t)value_;

//- (BOOL)validateEndPage:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* startPage;



@property int16_t startPageValue;
- (int16_t)startPageValue;
- (void)setStartPageValue:(int16_t)value_;

//- (BOOL)validateStartPage:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSSet *chapters;

- (NSMutableSet*)chaptersSet;




@property (nonatomic, strong) NSSet *partialChapters;

- (NSMutableSet*)partialChaptersSet;





@end

@interface _BookLog (CoreDataGeneratedAccessors)

- (void)addChapters:(NSSet*)value_;
- (void)removeChapters:(NSSet*)value_;
- (void)addChaptersObject:(BookChapter*)value_;
- (void)removeChaptersObject:(BookChapter*)value_;

- (void)addPartialChapters:(NSSet*)value_;
- (void)removePartialChapters:(NSSet*)value_;
- (void)addPartialChaptersObject:(BookChapter*)value_;
- (void)removePartialChaptersObject:(BookChapter*)value_;

@end

@interface _BookLog (CoreDataGeneratedPrimitiveAccessors)


- (NSNumber*)primitiveEndPage;
- (void)setPrimitiveEndPage:(NSNumber*)value;

- (int16_t)primitiveEndPageValue;
- (void)setPrimitiveEndPageValue:(int16_t)value_;




- (NSNumber*)primitiveStartPage;
- (void)setPrimitiveStartPage:(NSNumber*)value;

- (int16_t)primitiveStartPageValue;
- (void)setPrimitiveStartPageValue:(int16_t)value_;





- (NSMutableSet*)primitiveChapters;
- (void)setPrimitiveChapters:(NSMutableSet*)value;



- (NSMutableSet*)primitivePartialChapters;
- (void)setPrimitivePartialChapters:(NSMutableSet*)value;


@end
