// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to ReadingCollectionItem.m instead.

#import "_ReadingCollectionItem.h"

const struct ReadingCollectionItemAttributes ReadingCollectionItemAttributes = {
	.dateAddedToCollection = @"dateAddedToCollection",
	.details = @"details",
	.imageFileURL = @"imageFileURL",
	.notes = @"notes",
	.publishedDate = @"publishedDate",
	.rating = @"rating",
	.thumbnailImageFileURL = @"thumbnailImageFileURL",
	.title = @"title",
};

const struct ReadingCollectionItemRelationships ReadingCollectionItemRelationships = {
	.authors = @"authors",
	.logs = @"logs",
	.tags = @"tags",
};

const struct ReadingCollectionItemFetchedProperties ReadingCollectionItemFetchedProperties = {
};

@implementation ReadingCollectionItemID
@end

@implementation _ReadingCollectionItem

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"ReadingCollectionItem" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"ReadingCollectionItem";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"ReadingCollectionItem" inManagedObjectContext:moc_];
}

- (ReadingCollectionItemID*)objectID {
	return (ReadingCollectionItemID*)[super objectID];
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




@dynamic dateAddedToCollection;






@dynamic details;






@dynamic imageFileURL;






@dynamic notes;






@dynamic publishedDate;






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





@dynamic thumbnailImageFileURL;






@dynamic title;






@dynamic authors;

	
- (NSMutableSet*)authorsSet {
	[self willAccessValueForKey:@"authors"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"authors"];
  
	[self didAccessValueForKey:@"authors"];
	return result;
}
	

@dynamic logs;

	
- (NSMutableSet*)logsSet {
	[self willAccessValueForKey:@"logs"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"logs"];
  
	[self didAccessValueForKey:@"logs"];
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
