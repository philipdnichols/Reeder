// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Book.h instead.

#import <CoreData/CoreData.h>
#import "ReadingCollectionItem.h"

extern const struct BookAttributes {
	__unsafe_unretained NSString *pageCount;
	__unsafe_unretained NSString *publisher;
} BookAttributes;

extern const struct BookRelationships {
	__unsafe_unretained NSString *chapters;
} BookRelationships;

extern const struct BookFetchedProperties {
} BookFetchedProperties;

@class BookChapter;




@interface BookID : NSManagedObjectID {}
@end

@interface _Book : ReadingCollectionItem {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (BookID*)objectID;





@property (nonatomic, strong) NSNumber* pageCount;



@property int16_t pageCountValue;
- (int16_t)pageCountValue;
- (void)setPageCountValue:(int16_t)value_;

//- (BOOL)validatePageCount:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* publisher;



//- (BOOL)validatePublisher:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSSet *chapters;

- (NSMutableSet*)chaptersSet;





@end

@interface _Book (CoreDataGeneratedAccessors)

- (void)addChapters:(NSSet*)value_;
- (void)removeChapters:(NSSet*)value_;
- (void)addChaptersObject:(BookChapter*)value_;
- (void)removeChaptersObject:(BookChapter*)value_;

@end

@interface _Book (CoreDataGeneratedPrimitiveAccessors)


- (NSNumber*)primitivePageCount;
- (void)setPrimitivePageCount:(NSNumber*)value;

- (int16_t)primitivePageCountValue;
- (void)setPrimitivePageCountValue:(int16_t)value_;




- (NSString*)primitivePublisher;
- (void)setPrimitivePublisher:(NSString*)value;





- (NSMutableSet*)primitiveChapters;
- (void)setPrimitiveChapters:(NSMutableSet*)value;


@end
