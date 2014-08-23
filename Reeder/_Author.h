// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Author.h instead.

#import <CoreData/CoreData.h>


extern const struct AuthorAttributes {
	__unsafe_unretained NSString *name;
} AuthorAttributes;

extern const struct AuthorRelationships {
	__unsafe_unretained NSString *collectionItems;
	__unsafe_unretained NSString *tags;
} AuthorRelationships;

extern const struct AuthorFetchedProperties {
} AuthorFetchedProperties;

@class ReadingCollectionItem;
@class AuthorTag;



@interface AuthorID : NSManagedObjectID {}
@end

@interface _Author : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (AuthorID*)objectID;





@property (nonatomic, strong) NSString* name;



//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSSet *collectionItems;

- (NSMutableSet*)collectionItemsSet;




@property (nonatomic, strong) NSSet *tags;

- (NSMutableSet*)tagsSet;





@end

@interface _Author (CoreDataGeneratedAccessors)

- (void)addCollectionItems:(NSSet*)value_;
- (void)removeCollectionItems:(NSSet*)value_;
- (void)addCollectionItemsObject:(ReadingCollectionItem*)value_;
- (void)removeCollectionItemsObject:(ReadingCollectionItem*)value_;

- (void)addTags:(NSSet*)value_;
- (void)removeTags:(NSSet*)value_;
- (void)addTagsObject:(AuthorTag*)value_;
- (void)removeTagsObject:(AuthorTag*)value_;

@end

@interface _Author (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;





- (NSMutableSet*)primitiveCollectionItems;
- (void)setPrimitiveCollectionItems:(NSMutableSet*)value;



- (NSMutableSet*)primitiveTags;
- (void)setPrimitiveTags:(NSMutableSet*)value;


@end
