// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to AuthorTag.h instead.

#import <CoreData/CoreData.h>


extern const struct AuthorTagAttributes {
	__unsafe_unretained NSString *name;
} AuthorTagAttributes;

extern const struct AuthorTagRelationships {
	__unsafe_unretained NSString *authors;
} AuthorTagRelationships;

extern const struct AuthorTagFetchedProperties {
} AuthorTagFetchedProperties;

@class Author;



@interface AuthorTagID : NSManagedObjectID {}
@end

@interface _AuthorTag : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (AuthorTagID*)objectID;





@property (nonatomic, strong) NSString* name;



//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSSet *authors;

- (NSMutableSet*)authorsSet;





@end

@interface _AuthorTag (CoreDataGeneratedAccessors)

- (void)addAuthors:(NSSet*)value_;
- (void)removeAuthors:(NSSet*)value_;
- (void)addAuthorsObject:(Author*)value_;
- (void)removeAuthorsObject:(Author*)value_;

@end

@interface _AuthorTag (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;





- (NSMutableSet*)primitiveAuthors;
- (void)setPrimitiveAuthors:(NSMutableSet*)value;


@end
