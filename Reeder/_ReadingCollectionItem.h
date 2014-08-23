// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to ReadingCollectionItem.h instead.

#import <CoreData/CoreData.h>


extern const struct ReadingCollectionItemAttributes {
	__unsafe_unretained NSString *dateAddedToCollection;
	__unsafe_unretained NSString *imageFileURL;
	__unsafe_unretained NSString *notes;
	__unsafe_unretained NSString *publishedDate;
	__unsafe_unretained NSString *rating;
	__unsafe_unretained NSString *summary;
	__unsafe_unretained NSString *thumbnailImageFileURL;
	__unsafe_unretained NSString *title;
} ReadingCollectionItemAttributes;

extern const struct ReadingCollectionItemRelationships {
	__unsafe_unretained NSString *authors;
	__unsafe_unretained NSString *logs;
	__unsafe_unretained NSString *tags;
} ReadingCollectionItemRelationships;

extern const struct ReadingCollectionItemFetchedProperties {
} ReadingCollectionItemFetchedProperties;

@class Author;
@class ReadingLog;
@class ReadingCollectionItemTag;










@interface ReadingCollectionItemID : NSManagedObjectID {}
@end

@interface _ReadingCollectionItem : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (ReadingCollectionItemID*)objectID;





@property (nonatomic, strong) NSDate* dateAddedToCollection;



//- (BOOL)validateDateAddedToCollection:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* imageFileURL;



//- (BOOL)validateImageFileURL:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* notes;



//- (BOOL)validateNotes:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSDate* publishedDate;



//- (BOOL)validatePublishedDate:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* rating;



@property int16_t ratingValue;
- (int16_t)ratingValue;
- (void)setRatingValue:(int16_t)value_;

//- (BOOL)validateRating:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* summary;



//- (BOOL)validateSummary:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* thumbnailImageFileURL;



//- (BOOL)validateThumbnailImageFileURL:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* title;



//- (BOOL)validateTitle:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSSet *authors;

- (NSMutableSet*)authorsSet;




@property (nonatomic, strong) NSSet *logs;

- (NSMutableSet*)logsSet;




@property (nonatomic, strong) NSSet *tags;

- (NSMutableSet*)tagsSet;





@end

@interface _ReadingCollectionItem (CoreDataGeneratedAccessors)

- (void)addAuthors:(NSSet*)value_;
- (void)removeAuthors:(NSSet*)value_;
- (void)addAuthorsObject:(Author*)value_;
- (void)removeAuthorsObject:(Author*)value_;

- (void)addLogs:(NSSet*)value_;
- (void)removeLogs:(NSSet*)value_;
- (void)addLogsObject:(ReadingLog*)value_;
- (void)removeLogsObject:(ReadingLog*)value_;

- (void)addTags:(NSSet*)value_;
- (void)removeTags:(NSSet*)value_;
- (void)addTagsObject:(ReadingCollectionItemTag*)value_;
- (void)removeTagsObject:(ReadingCollectionItemTag*)value_;

@end

@interface _ReadingCollectionItem (CoreDataGeneratedPrimitiveAccessors)


- (NSDate*)primitiveDateAddedToCollection;
- (void)setPrimitiveDateAddedToCollection:(NSDate*)value;




- (NSString*)primitiveImageFileURL;
- (void)setPrimitiveImageFileURL:(NSString*)value;




- (NSString*)primitiveNotes;
- (void)setPrimitiveNotes:(NSString*)value;




- (NSDate*)primitivePublishedDate;
- (void)setPrimitivePublishedDate:(NSDate*)value;




- (NSNumber*)primitiveRating;
- (void)setPrimitiveRating:(NSNumber*)value;

- (int16_t)primitiveRatingValue;
- (void)setPrimitiveRatingValue:(int16_t)value_;




- (NSString*)primitiveSummary;
- (void)setPrimitiveSummary:(NSString*)value;




- (NSString*)primitiveThumbnailImageFileURL;
- (void)setPrimitiveThumbnailImageFileURL:(NSString*)value;




- (NSString*)primitiveTitle;
- (void)setPrimitiveTitle:(NSString*)value;





- (NSMutableSet*)primitiveAuthors;
- (void)setPrimitiveAuthors:(NSMutableSet*)value;



- (NSMutableSet*)primitiveLogs;
- (void)setPrimitiveLogs:(NSMutableSet*)value;



- (NSMutableSet*)primitiveTags;
- (void)setPrimitiveTags:(NSMutableSet*)value;


@end
