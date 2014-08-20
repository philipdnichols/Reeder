// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to ReadingCollectionItemTag.m instead.

#import "_ReadingCollectionItemTag.h"

const struct ReadingCollectionItemTagAttributes ReadingCollectionItemTagAttributes = {
	.name = @"name",
};

const struct ReadingCollectionItemTagRelationships ReadingCollectionItemTagRelationships = {
	.collectionItems = @"collectionItems",
};

const struct ReadingCollectionItemTagFetchedProperties ReadingCollectionItemTagFetchedProperties = {
};

@implementation ReadingCollectionItemTagID
@end

@implementation _ReadingCollectionItemTag

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"ReadingCollectionItemTag" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"ReadingCollectionItemTag";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"ReadingCollectionItemTag" inManagedObjectContext:moc_];
}

- (ReadingCollectionItemTagID*)objectID {
	return (ReadingCollectionItemTagID*)[super objectID];
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
	






@end
