// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to ReadingLogTag.m instead.

#import "_ReadingLogTag.h"

const struct ReadingLogTagAttributes ReadingLogTagAttributes = {
	.name = @"name",
};

const struct ReadingLogTagRelationships ReadingLogTagRelationships = {
	.logs = @"logs",
};

const struct ReadingLogTagFetchedProperties ReadingLogTagFetchedProperties = {
};

@implementation ReadingLogTagID
@end

@implementation _ReadingLogTag

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"ReadingLogTag" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"ReadingLogTag";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"ReadingLogTag" inManagedObjectContext:moc_];
}

- (ReadingLogTagID*)objectID {
	return (ReadingLogTagID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	

	return keyPaths;
}




@dynamic name;






@dynamic logs;

	






@end
