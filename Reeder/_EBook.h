// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to EBook.h instead.

#import <CoreData/CoreData.h>
#import "ReadingCollectionItem.h"

extern const struct EBookAttributes {
	__unsafe_unretained NSString *publisher;
} EBookAttributes;

extern const struct EBookRelationships {
	__unsafe_unretained NSString *chapters;
} EBookRelationships;

extern const struct EBookFetchedProperties {
} EBookFetchedProperties;

@class EBookChapter;



@interface EBookID : NSManagedObjectID {}
@end

@interface _EBook : ReadingCollectionItem {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (EBookID*)objectID;





@property (nonatomic, strong) NSString* publisher;



//- (BOOL)validatePublisher:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSSet *chapters;

- (NSMutableSet*)chaptersSet;





@end

@interface _EBook (CoreDataGeneratedAccessors)

- (void)addChapters:(NSSet*)value_;
- (void)removeChapters:(NSSet*)value_;
- (void)addChaptersObject:(EBookChapter*)value_;
- (void)removeChaptersObject:(EBookChapter*)value_;

@end

@interface _EBook (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitivePublisher;
- (void)setPrimitivePublisher:(NSString*)value;





- (NSMutableSet*)primitiveChapters;
- (void)setPrimitiveChapters:(NSMutableSet*)value;


@end
