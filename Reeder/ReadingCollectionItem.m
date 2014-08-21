#import "ReadingCollectionItem.h"
#import "UIImage+IO.h"

@interface ReadingCollectionItem ()

@end

@implementation ReadingCollectionItem

- (void)saveWithSuccess:(void(^)())success failure:(void(^)(NSError *error))failure
{
    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreWithCompletion:^(BOOL succ, NSError *error) {
        if (!error) {
            success();
        } else {
            failure(error);
        }
    }];
}

- (void)deleteWithSuccess:(void(^)())success failure:(void(^)(NSError *error))failure
{
    [self MR_deleteEntity];
    
//    [UIImage deleteFromDiskWithFilePathURL:[NSURL fileURLWithPath:self.thumbnailImageFileURL]];
//    [UIImage deleteFromDiskWithFilePathURL:[NSURL fileURLWithPath:self.imageFileURL]];
    
    // TODO unlink things and delete logs and tags, etc associated with this collection item
    
    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreWithCompletion:^(BOOL succ, NSError *error) {
        if (!error) {
            success();
        } else {
            failure(error);
        }
    }];
}

@end
