// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to ReadingCollectionItemTag.h instead.

#import <CoreData/CoreData.h>


extern const struct ReadingCollectionItemTagAttributes {
	__unsafe_unretained NSString *name;
} ReadingCollectionItemTagAttributes;

extern const struct ReadingCollectionItemTagRelationships {
	__unsafe_unretained NSString *collectionItems;
} ReadingCollectionItemTagRelationships;

extern const struct ReadingCollectionItemTagFetchedProperties {
} ReadingCollectionItemTagFetchedProperties;

@class ReadingCollectionItem;



@interface ReadingCollectionItemTagID : NSManagedObjectID {}
@end

@interface _ReadingCollectionItemTag : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (ReadingCollectionItemTagID*)objectID;





@property (nonatomic, strong) NSString* name;



//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSSet *collectionItems;

- (NSMutableSet*)collectionItemsSet;





@end

@interface _ReadingCollectionItemTag (CoreDataGeneratedAccessors)

- (void)addCollectionItems:(NSSet*)value_;
- (void)removeCollectionItems:(NSSet*)value_;
- (void)addCollectionItemsObject:(ReadingCollectionItem*)value_;
- (void)removeCollectionItemsObject:(ReadingCollectionItem*)value_;

@end

@interface _ReadingCollectionItemTag (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;





- (NSMutableSet*)primitiveCollectionItems;
- (void)setPrimitiveCollectionItems:(NSMutableSet*)value;


@end
