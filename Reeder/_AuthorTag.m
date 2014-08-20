// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to AuthorTag.m instead.

#import "_AuthorTag.h"

const struct AuthorTagAttributes AuthorTagAttributes = {
	.name = @"name",
};

const struct AuthorTagRelationships AuthorTagRelationships = {
	.authors = @"authors",
};

const struct AuthorTagFetchedProperties AuthorTagFetchedProperties = {
};

@implementation AuthorTagID
@end

@implementation _AuthorTag

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"AuthorTag" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"AuthorTag";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"AuthorTag" inManagedObjectContext:moc_];
}

- (AuthorTagID*)objectID {
	return (AuthorTagID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	

	return keyPaths;
}




@dynamic name;






@dynamic authors;

	
- (NSMutableSet*)authorsSet {
	[self willAccessValueForKey:@"authors"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"authors"];
  
	[self didAccessValueForKey:@"authors"];
	return result;
}
	






@end
