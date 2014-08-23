#import "ReadingLog.h"
#import "ReadingLogTag.h"
#import "ReadingCollectionItem.h"

@interface ReadingLog ()

@end

@implementation ReadingLog

- (void)deleteWithSuccess:(void(^)())success failure:(void(^)(NSError *error))failure
{
    [self.collectionItem removeLogsObject:self];
    
    for (ReadingLogTag *tag in self.tags) {
        [tag removeLogsObject:self];
        
        if (![tag.logs count]) {
            [tag deleteWithSuccess:nil failure:nil];
        }
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
