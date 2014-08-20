// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to ReadingLog.h instead.

#import <CoreData/CoreData.h>


extern const struct ReadingLogAttributes {
	__unsafe_unretained NSString *endTime;
	__unsafe_unretained NSString *notes;
	__unsafe_unretained NSString *rating;
	__unsafe_unretained NSString *startTime;
} ReadingLogAttributes;

extern const struct ReadingLogRelationships {
	__unsafe_unretained NSString *collectionItem;
	__unsafe_unretained NSString *tags;
} ReadingLogRelationships;

extern const struct ReadingLogFetchedProperties {
} ReadingLogFetchedProperties;

@class ReadingCollectionItem;
@class ReadingLogTag;






@interface ReadingLogID : NSManagedObjectID {}
@end

@interface _ReadingLog : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (ReadingLogID*)objectID;





@property (nonatomic, strong) NSDate* endTime;



//- (BOOL)validateEndTime:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* notes;



//- (BOOL)validateNotes:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* rating;



@property int16_t ratingValue;
- (int16_t)ratingValue;
- (void)setRatingValue:(int16_t)value_;

//- (BOOL)validateRating:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSDate* startTime;



//- (BOOL)validateStartTime:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) ReadingCollectionItem *collectionItem;

//- (BOOL)validateCollectionItem:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSSet *tags;

- (NSMutableSet*)tagsSet;





@end

@interface _ReadingLog (CoreDataGeneratedAccessors)

- (void)addTags:(NSSet*)value_;
- (void)removeTags:(NSSet*)value_;
- (void)addTagsObject:(ReadingLogTag*)value_;
- (void)removeTagsObject:(ReadingLogTag*)value_;

@end

@interface _ReadingLog (CoreDataGeneratedPrimitiveAccessors)


- (NSDate*)primitiveEndTime;
- (void)setPrimitiveEndTime:(NSDate*)value;




- (NSString*)primitiveNotes;
- (void)setPrimitiveNotes:(NSString*)value;




- (NSNumber*)primitiveRating;
- (void)setPrimitiveRating:(NSNumber*)value;

- (int16_t)primitiveRatingValue;
- (void)setPrimitiveRatingValue:(int16_t)value_;




- (NSDate*)primitiveStartTime;
- (void)setPrimitiveStartTime:(NSDate*)value;





- (ReadingCollectionItem*)primitiveCollectionItem;
- (void)setPrimitiveCollectionItem:(ReadingCollectionItem*)value;



- (NSMutableSet*)primitiveTags;
- (void)setPrimitiveTags:(NSMutableSet*)value;


@end
