#import "ReadingLogTag.h"
#import "ReadingLog.h"

@interface ReadingLogTag ()

@end

@implementation ReadingLogTag

- (void)deleteWithSuccess:(void(^)())success failure:(void(^)(NSError *error))failure
{
    for (ReadingLog *readingLog in self.logs) {
        [readingLog removeTagsObject:self];
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
