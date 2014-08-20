// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to EBook.m instead.

#import "_EBook.h"

const struct EBookAttributes EBookAttributes = {
	.publisher = @"publisher",
};

const struct EBookRelationships EBookRelationships = {
	.chapters = @"chapters",
};

const struct EBookFetchedProperties EBookFetchedProperties = {
};

@implementation EBookID
@end

@implementation _EBook

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"EBook" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"EBook";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"EBook" inManagedObjectContext:moc_];
}

- (EBookID*)objectID {
	return (EBookID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	

	return keyPaths;
}




@dynamic publisher;






@dynamic chapters;

	
- (NSMutableSet*)chaptersSet {
	[self willAccessValueForKey:@"chapters"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"chapters"];
  
	[self didAccessValueForKey:@"chapters"];
	return result;
}
	






@end
