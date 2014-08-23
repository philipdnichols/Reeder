// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Author.m instead.

#import "_Author.h"

const struct AuthorAttributes AuthorAttributes = {
	.name = @"name",
};

const struct AuthorRelationships AuthorRelationships = {
	.collectionItems = @"collectionItems",
	.tags = @"tags",
};

const struct AuthorFetchedProperties AuthorFetchedProperties = {
};

@implementation AuthorID
@end

@implementation _Author

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Author" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Author";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Author" inManagedObjectContext:moc_];
}

- (AuthorID*)objectID {
	return (AuthorID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	

	return keyPaths;
}




@dynamic name;






@dynamic collectionItems;

	
- (NSMutableSet*)collectionItemsSet {
	[self willAccessValueForKey:@"collectionItems"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"collectionItems"];
  
	[self didAccessValueForKey:@"collectionItems"];
	return result;
}
	

@dynamic tags;

	
- (NSMutableSet*)tagsSet {
	[self willAccessValueForKey:@"tags"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"tags"];
  
	[self didAccessValueForKey:@"tags"];
	return result;
}
	






@end
