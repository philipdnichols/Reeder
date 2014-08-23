#import "ReadingCollectionItemTag.h"
#import "ReadingCollectionItem.h"


@interface ReadingCollectionItemTag ()

@end

@implementation ReadingCollectionItemTag

- (void)deleteWithSuccess:(void(^)())success failure:(void(^)(NSError *error))failure
{
    for (ReadingCollectionItem *readingCollectionItem in self.collectionItems) {
        [readingCollectionItem removeTagsObject:self];
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
