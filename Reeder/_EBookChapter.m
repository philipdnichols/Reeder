// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to EBookChapter.m instead.

#import "_EBookChapter.h"

const struct EBookChapterAttributes EBookChapterAttributes = {
	.name = @"name",
	.percentage = @"percentage",
};

const struct EBookChapterRelationships EBookChapterRelationships = {
	.ebook = @"ebook",
	.ebookLogs = @"ebookLogs",
	.partialEbookLogs = @"partialEbookLogs",
};

const struct EBookChapterFetchedProperties EBookChapterFetchedProperties = {
};

@implementation EBookChapterID
@end

@implementation _EBookChapter

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"EBookChapter" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"EBookChapter";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"EBookChapter" inManagedObjectContext:moc_];
}

- (EBookChapterID*)objectID {
	return (EBookChapterID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	

	return keyPaths;
}




@dynamic name;






@dynamic percentage;






@dynamic ebook;

	

@dynamic ebookLogs;

	
- (NSMutableSet*)ebookLogsSet {
	[self willAccessValueForKey:@"ebookLogs"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"ebookLogs"];
  
	[self didAccessValueForKey:@"ebookLogs"];
	return result;
}
	

@dynamic partialEbookLogs;

	
- (NSMutableSet*)partialEbookLogsSet {
	[self willAccessValueForKey:@"partialEbookLogs"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"partialEbookLogs"];
  
	[self didAccessValueForKey:@"partialEbookLogs"];
	return result;
}
	






@end
