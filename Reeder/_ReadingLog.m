// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to ReadingLog.m instead.

#import "_ReadingLog.h"

const struct ReadingLogAttributes ReadingLogAttributes = {
	.endTime = @"endTime",
	.notes = @"notes",
	.rating = @"rating",
	.startTime = @"startTime",
};

const struct ReadingLogRelationships ReadingLogRelationships = {
	.collectionItem = @"collectionItem",
	.tags = @"tags",
};

const struct ReadingLogFetchedProperties ReadingLogFetchedProperties = {
};

@implementation ReadingLogID
@end

@implementation _ReadingLog

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"ReadingLog" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"ReadingLog";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"ReadingLog" inManagedObjectContext:moc_];
}

- (ReadingLogID*)objectID {
	return (ReadingLogID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"ratingValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"rating"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}




@dynamic endTime;






@dynamic notes;






@dynamic rating;



- (int16_t)ratingValue {
	NSNumber *result = [self rating];
	return [result shortValue];
}

- (void)setRatingValue:(int16_t)value_ {
	[self setRating:[NSNumber numberWithShort:value_]];
}

- (int16_t)primitiveRatingValue {
	NSNumber *result = [self primitiveRating];
	return [result shortValue];
}

- (void)setPrimitiveRatingValue:(int16_t)value_ {
	[self setPrimitiveRating:[NSNumber numberWithShort:value_]];
}





@dynamic startTime;






@dynamic collectionItem;

	

@dynamic tags;

	
- (NSMutableSet*)tagsSet {
	[self willAccessValueForKey:@"tags"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"tags"];
  
	[self didAccessValueForKey:@"tags"];
	return result;
}
	






@end
