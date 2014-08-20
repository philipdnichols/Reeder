// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to EBookChapter.h instead.

#import <CoreData/CoreData.h>


extern const struct EBookChapterAttributes {
	__unsafe_unretained NSString *name;
	__unsafe_unretained NSString *percentage;
} EBookChapterAttributes;

extern const struct EBookChapterRelationships {
	__unsafe_unretained NSString *ebook;
	__unsafe_unretained NSString *ebookLogs;
	__unsafe_unretained NSString *partialEbookLogs;
} EBookChapterRelationships;

extern const struct EBookChapterFetchedProperties {
} EBookChapterFetchedProperties;

@class EBook;
@class EBookLog;
@class EBookLog;




@interface EBookChapterID : NSManagedObjectID {}
@end

@interface _EBookChapter : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (EBookChapterID*)objectID;





@property (nonatomic, strong) NSString* name;



//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSDecimalNumber* percentage;



//- (BOOL)validatePercentage:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) EBook *ebook;

//- (BOOL)validateEbook:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSSet *ebookLogs;

- (NSMutableSet*)ebookLogsSet;




@property (nonatomic, strong) NSSet *partialEbookLogs;

- (NSMutableSet*)partialEbookLogsSet;





@end

@interface _EBookChapter (CoreDataGeneratedAccessors)

- (void)addEbookLogs:(NSSet*)value_;
- (void)removeEbookLogs:(NSSet*)value_;
- (void)addEbookLogsObject:(EBookLog*)value_;
- (void)removeEbookLogsObject:(EBookLog*)value_;

- (void)addPartialEbookLogs:(NSSet*)value_;
- (void)removePartialEbookLogs:(NSSet*)value_;
- (void)addPartialEbookLogsObject:(EBookLog*)value_;
- (void)removePartialEbookLogsObject:(EBookLog*)value_;

@end

@interface _EBookChapter (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;




- (NSDecimalNumber*)primitivePercentage;
- (void)setPrimitivePercentage:(NSDecimalNumber*)value;





- (EBook*)primitiveEbook;
- (void)setPrimitiveEbook:(EBook*)value;



- (NSMutableSet*)primitiveEbookLogs;
- (void)setPrimitiveEbookLogs:(NSMutableSet*)value;



- (NSMutableSet*)primitivePartialEbookLogs;
- (void)setPrimitivePartialEbookLogs:(NSMutableSet*)value;


@end
