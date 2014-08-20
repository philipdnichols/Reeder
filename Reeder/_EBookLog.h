// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to EBookLog.h instead.

#import <CoreData/CoreData.h>
#import "ReadingLog.h"

extern const struct EBookLogAttributes {
	__unsafe_unretained NSString *chaptersRead;
	__unsafe_unretained NSString *endPercent;
	__unsafe_unretained NSString *partialChaptersRead;
	__unsafe_unretained NSString *startPercent;
} EBookLogAttributes;

extern const struct EBookLogRelationships {
	__unsafe_unretained NSString *chapters;
	__unsafe_unretained NSString *partialChapters;
} EBookLogRelationships;

extern const struct EBookLogFetchedProperties {
} EBookLogFetchedProperties;

@class EBookChapter;
@class EBookChapter;






@interface EBookLogID : NSManagedObjectID {}
@end

@interface _EBookLog : ReadingLog {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (EBookLogID*)objectID;





@property (nonatomic, strong) NSString* chaptersRead;



//- (BOOL)validateChaptersRead:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSDecimalNumber* endPercent;



//- (BOOL)validateEndPercent:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* partialChaptersRead;



//- (BOOL)validatePartialChaptersRead:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSDecimalNumber* startPercent;



//- (BOOL)validateStartPercent:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSSet *chapters;

- (NSMutableSet*)chaptersSet;




@property (nonatomic, strong) NSSet *partialChapters;

- (NSMutableSet*)partialChaptersSet;





@end

@interface _EBookLog (CoreDataGeneratedAccessors)

- (void)addChapters:(NSSet*)value_;
- (void)removeChapters:(NSSet*)value_;
- (void)addChaptersObject:(EBookChapter*)value_;
- (void)removeChaptersObject:(EBookChapter*)value_;

- (void)addPartialChapters:(NSSet*)value_;
- (void)removePartialChapters:(NSSet*)value_;
- (void)addPartialChaptersObject:(EBookChapter*)value_;
- (void)removePartialChaptersObject:(EBookChapter*)value_;

@end

@interface _EBookLog (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveChaptersRead;
- (void)setPrimitiveChaptersRead:(NSString*)value;




- (NSDecimalNumber*)primitiveEndPercent;
- (void)setPrimitiveEndPercent:(NSDecimalNumber*)value;




- (NSString*)primitivePartialChaptersRead;
- (void)setPrimitivePartialChaptersRead:(NSString*)value;




- (NSDecimalNumber*)primitiveStartPercent;
- (void)setPrimitiveStartPercent:(NSDecimalNumber*)value;





- (NSMutableSet*)primitiveChapters;
- (void)setPrimitiveChapters:(NSMutableSet*)value;



- (NSMutableSet*)primitivePartialChapters;
- (void)setPrimitivePartialChapters:(NSMutableSet*)value;


@end
