#import "BookChapter.h"
#import "Book.h"
#import "BookLog.h"

@interface BookChapter ()

@end

@implementation BookChapter

- (void)deleteWithSuccess:(void (^)())success failure:(void (^)(NSError *))failure
{
    [self.book removeChaptersObject:self];
    
    for (BookLog *bookLog in self.bookLogs) {
        [bookLog removeChaptersObject:self];
    }
    
    for (BookLog *partialBookLog in self.partialBookLogs) {
        [partialBookLog removeChaptersObject:self];
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
