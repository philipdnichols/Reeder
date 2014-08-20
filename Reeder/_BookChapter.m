// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to BookChapter.m instead.

#import "_BookChapter.h"

const struct BookChapterAttributes BookChapterAttributes = {
	.name = @"name",
	.pageCount = @"pageCount",
};

const struct BookChapterRelationships BookChapterRelationships = {
	.book = @"book",
	.bookLogs = @"bookLogs",
	.partialBookLogs = @"partialBookLogs",
};

const struct BookChapterFetchedProperties BookChapterFetchedProperties = {
};

@implementation BookChapterID
@end

@implementation _BookChapter

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"BookChapter" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"BookChapter";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"BookChapter" inManagedObjectContext:moc_];
}

- (BookChapterID*)objectID {
	return (BookChapterID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"pageCountValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"pageCount"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}




@dynamic name;






@dynamic pageCount;



- (int16_t)pageCountValue {
	NSNumber *result = [self pageCount];
	return [result shortValue];
}

- (void)setPageCountValue:(int16_t)value_ {
	[self setPageCount:[NSNumber numberWithShort:value_]];
}

- (int16_t)primitivePageCountValue {
	NSNumber *result = [self primitivePageCount];
	return [result shortValue];
}

- (void)setPrimitivePageCountValue:(int16_t)value_ {
	[self setPrimitivePageCount:[NSNumber numberWithShort:value_]];
}





@dynamic book;

	

@dynamic bookLogs;

	
- (NSMutableSet*)bookLogsSet {
	[self willAccessValueForKey:@"bookLogs"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"bookLogs"];
  
	[self didAccessValueForKey:@"bookLogs"];
	return result;
}
	

@dynamic partialBookLogs;

	
- (NSMutableSet*)partialBookLogsSet {
	[self willAccessValueForKey:@"partialBookLogs"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"partialBookLogs"];
  
	[self didAccessValueForKey:@"partialBookLogs"];
	return result;
}
	






@end
