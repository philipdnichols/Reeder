// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to BookChapter.h instead.

#import <CoreData/CoreData.h>


extern const struct BookChapterAttributes {
	__unsafe_unretained NSString *name;
	__unsafe_unretained NSString *pageCount;
} BookChapterAttributes;

extern const struct BookChapterRelationships {
	__unsafe_unretained NSString *book;
	__unsafe_unretained NSString *bookLogs;
	__unsafe_unretained NSString *partialBookLogs;
} BookChapterRelationships;

extern const struct BookChapterFetchedProperties {
} BookChapterFetchedProperties;

@class Book;
@class BookLog;
@class BookLog;




@interface BookChapterID : NSManagedObjectID {}
@end

@interface _BookChapter : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (BookChapterID*)objectID;





@property (nonatomic, strong) NSString* name;



//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* pageCount;



@property int16_t pageCountValue;
- (int16_t)pageCountValue;
- (void)setPageCountValue:(int16_t)value_;

//- (BOOL)validatePageCount:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) Book *book;

//- (BOOL)validateBook:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSSet *bookLogs;

- (NSMutableSet*)bookLogsSet;




@property (nonatomic, strong) NSSet *partialBookLogs;

- (NSMutableSet*)partialBookLogsSet;





@end

@interface _BookChapter (CoreDataGeneratedAccessors)

- (void)addBookLogs:(NSSet*)value_;
- (void)removeBookLogs:(NSSet*)value_;
- (void)addBookLogsObject:(BookLog*)value_;
- (void)removeBookLogsObject:(BookLog*)value_;

- (void)addPartialBookLogs:(NSSet*)value_;
- (void)removePartialBookLogs:(NSSet*)value_;
- (void)addPartialBookLogsObject:(BookLog*)value_;
- (void)removePartialBookLogsObject:(BookLog*)value_;

@end

@interface _BookChapter (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;




- (NSNumber*)primitivePageCount;
- (void)setPrimitivePageCount:(NSNumber*)value;

- (int16_t)primitivePageCountValue;
- (void)setPrimitivePageCountValue:(int16_t)value_;





- (Book*)primitiveBook;
- (void)setPrimitiveBook:(Book*)value;



- (NSMutableSet*)primitiveBookLogs;
- (void)setPrimitiveBookLogs:(NSMutableSet*)value;



- (NSMutableSet*)primitivePartialBookLogs;
- (void)setPrimitivePartialBookLogs:(NSMutableSet*)value;


@end
