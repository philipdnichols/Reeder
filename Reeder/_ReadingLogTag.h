// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to ReadingLogTag.h instead.

#import <CoreData/CoreData.h>


extern const struct ReadingLogTagAttributes {
	__unsafe_unretained NSString *name;
} ReadingLogTagAttributes;

extern const struct ReadingLogTagRelationships {
	__unsafe_unretained NSString *logs;
} ReadingLogTagRelationships;

extern const struct ReadingLogTagFetchedProperties {
} ReadingLogTagFetchedProperties;

@class ReadingLog;



@interface ReadingLogTagID : NSManagedObjectID {}
@end

@interface _ReadingLogTag : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (ReadingLogTagID*)objectID;





@property (nonatomic, strong) NSString* name;



//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSSet *logs;

- (NSMutableSet*)logsSet;





@end

@interface _ReadingLogTag (CoreDataGeneratedAccessors)

- (void)addLogs:(NSSet*)value_;
- (void)removeLogs:(NSSet*)value_;
- (void)addLogsObject:(ReadingLog*)value_;
- (void)removeLogsObject:(ReadingLog*)value_;

@end

@interface _ReadingLogTag (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;





- (NSMutableSet*)primitiveLogs;
- (void)setPrimitiveLogs:(NSMutableSet*)value;


@end
