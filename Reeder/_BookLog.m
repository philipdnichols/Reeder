// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to BookLog.m instead.

#import "_BookLog.h"

const struct BookLogAttributes BookLogAttributes = {
	.endPage = @"endPage",
	.startPage = @"startPage",
};

const struct BookLogRelationships BookLogRelationships = {
	.chapters = @"chapters",
	.partialChapters = @"partialChapters",
};

const struct BookLogFetchedProperties BookLogFetchedProperties = {
};

@implementation BookLogID
@end

@implementation _BookLog

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"BookLog" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"BookLog";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"BookLog" inManagedObjectContext:moc_];
}

- (BookLogID*)objectID {
	return (BookLogID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"endPageValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"endPage"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"startPageValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"startPage"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}




@dynamic endPage;



- (int16_t)endPageValue {
	NSNumber *result = [self endPage];
	return [result shortValue];
}

- (void)setEndPageValue:(int16_t)value_ {
	[self setEndPage:[NSNumber numberWithShort:value_]];
}

- (int16_t)primitiveEndPageValue {
	NSNumber *result = [self primitiveEndPage];
	return [result shortValue];
}

- (void)setPrimitiveEndPageValue:(int16_t)value_ {
	[self setPrimitiveEndPage:[NSNumber numberWithShort:value_]];
}





@dynamic startPage;



- (int16_t)startPageValue {
	NSNumber *result = [self startPage];
	return [result shortValue];
}

- (void)setStartPageValue:(int16_t)value_ {
	[self setStartPage:[NSNumber numberWithShort:value_]];
}

- (int16_t)primitiveStartPageValue {
	NSNumber *result = [self primitiveStartPage];
	return [result shortValue];
}

- (void)setPrimitiveStartPageValue:(int16_t)value_ {
	[self setPrimitiveStartPage:[NSNumber numberWithShort:value_]];
}





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
