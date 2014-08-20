// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to EBookLog.m instead.

#import "_EBookLog.h"

const struct EBookLogAttributes EBookLogAttributes = {
	.chaptersRead = @"chaptersRead",
	.endPercent = @"endPercent",
	.partialChaptersRead = @"partialChaptersRead",
	.startPercent = @"startPercent",
};

const struct EBookLogRelationships EBookLogRelationships = {
	.chapters = @"chapters",
	.partialChapters = @"partialChapters",
};

const struct EBookLogFetchedProperties EBookLogFetchedProperties = {
};

@implementation EBookLogID
@end

@implementation _EBookLog

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"EBookLog" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"EBookLog";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"EBookLog" inManagedObjectContext:moc_];
}

- (EBookLogID*)objectID {
	return (EBookLogID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	

	return keyPaths;
}




@dynamic chaptersRead;






@dynamic endPercent;






@dynamic partialChaptersRead;






@dynamic startPercent;






@dynamic chapters;

	
- (NSMutableSet*)chaptersSet {
	[self willAccessValueForKey:@"chapters"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"chapters"];
  
	[self didAccessValueForKey:@"chapters"];
	return result;
}
	

@dynamic partialChapters;

	
- (NSMutableSet*)partialChaptersSet {
	[self willAccessValueForKey:@"partialChapters"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"partialChapters"];
  
	[self didAccessValueForKey:@"partialChapters"];
	return result;
}
	






@end
