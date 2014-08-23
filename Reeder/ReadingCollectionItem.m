#import "ReadingCollectionItem.h"
#import "UIImage+IO.h"
#import "Author.h"
#import "ReadingCollectionItemTag.h"
#import "ReadingLog.h"

@interface ReadingCollectionItem ()

@end

@implementation ReadingCollectionItem

#pragma mark - Properties

- (NSString *)formattedAuthors
{
    NSMutableArray *authorNames = [NSMutableArray array];
    [self.authors enumerateObjectsUsingBlock:^(Author *author, BOOL *stop) {
        [authorNames addObject:author.name];
    }];
    
    return [authorNames componentsJoinedByString:@", "];
}

- (NSString *)formattedTags
{
    NSMutableArray *tagNames = [NSMutableArray array];
    [self.tags enumerateObjectsUsingBlock:^(ReadingCollectionItemTag *tag, BOOL *stop) {
        [tagNames addObject:tag.name];
    }];
    
    return [tagNames componentsJoinedByString:@", "];
}

#pragma mark - Public

+ (NSArray *)typesAsTypes
{
    return @[@(ReadingCollectionItemTypeBook), @(ReadingCollectionItemTypeEBook)];
}

+ (NSArray *)typesAsStrings
{
    NSMutableArray *typesAsStrings = [NSMutableArray array];
    for (NSNumber *type in [self typesAsTypes]) {
        [typesAsStrings addObject:[self stringFromType:(ReadingCollectionItemType)[type unsignedIntegerValue]]];
    }
    return typesAsStrings;
}

+ (NSString *)stringFromType:(ReadingCollectionItemType)type
{
    static NSDictionary *stringTypes = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        stringTypes = @{
                        @(ReadingCollectionItemTypeBook) : @"Book",
                        @(ReadingCollectionItemTypeEBook) : @"E-Book"
                        };
    });
    
    return stringTypes[@(type)];
}

- (void)saveWithSuccess:(void(^)())success failure:(void(^)(NSError *error))failure
{
    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreWithCompletion:^(BOOL succ, NSError *error) {
        if (!error) {
            if (success) {
                success();
            }
        } else {
            if (failure) {
                // TODO: If there is an error saving on the initial save, we should delete the photos. Not sure where to put this right now.
                failure(error);
            }
        }
    }];
}

- (void)deleteWithSuccess:(void(^)())success failure:(void(^)(NSError *error))failure
{
    if (self.imageFileURL) {
        [UIImage deleteFromDiskAsyncWithFilePathURL:[NSURL fileURLWithPath:self.imageFileURL] withSuccess:nil failure:nil];
    }
    if (self.thumbnailImageFileURL) {
        [UIImage deleteFromDiskAsyncWithFilePathURL:[NSURL fileURLWithPath:self.thumbnailImageFileURL] withSuccess:nil failure:nil];
    }
    
    for (Author *author in self.authors) {
        [author removeCollectionItemsObject:self];
        
        if (![author.collectionItems count]) {
            [author deleteWithSuccess:nil failure:nil];
        }
    }
    
    for (ReadingCollectionItemTag *tag in self.tags) {
        [tag removeCollectionItemsObject:self];
        
        if (![tag.collectionItems count]) {
            [tag deleteWithSuccess:nil failure:nil];
        }
    }
    
    for (ReadingLog *readingLog in self.logs) {
        [readingLog deleteWithSuccess:nil failure:nil];
    }
    
    [self MR_deleteEntity];
    
    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreWithCompletion:^(BOOL succ, NSError *error) {
        if (!error) {
            if (success) {
                success();
            }
        } else {
            if (failure) {
                failure(error);
            }
        }
    }];
}

@end
